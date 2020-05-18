class ClapsController < ApplicationController
  SOUND_LIST = [
    'clap.mp3',
    'laugh.mp3',
    'surprized.mp3'
  ].freeze

  def new
    @hash_tag = hash_tag
  end

  def create
    Clap.create({ hash_tag: hash_tag, sound_name: sound_name })

    flash[:success] = "You Clapped to [#{hash_tag}] !"
    redirect_to root_path(hash_tag: hash_tag)
  end

  def view
    @hash_tag = hash_tag
  end

  def count_clap
    all_active_claps =
      Clap.all.
        reject { |clap| clap.hidden }.
        select { |clap| clap.hash_tag == hash_tag }

    @active_claps = all_active_claps.sort_by { |c| c.id }
    @new_clap = new_clap?(@active_claps&.last)
    latest_sound = all_active_claps.last&.sound_name
    @sound = SOUND_LIST.include?(latest_sound) ? latest_sound : nil

    view!(all_active_claps)
    reset_claps!(hash_tag)
    render partial: 'count_clap'
  end

  private

  def reset_claps!(tag)
    visible_claps =
      Clap.all.
        select { |clap| clap.hash_tag == tag }.
        reject { |clap| clap.hidden }

    if visible_claps.count > Clap::MAX_VISIBLE_CLAPS
      visible_claps.each { |clap| clap.update(hidden: true) }
    end
  end

  def new_clap?(clap)
    return nil unless clap.present?

    clap.created_at >= (DateTime.current - Clap::FETCH_INTERVAL.second)
  end

  def view!(claps)
    claps.each { |clap| clap.update(viewed: true) }
  end

  def hash_tag
    params[:hash_tag]
  end

  def sound_name
    params['sound_name']
  end
end
