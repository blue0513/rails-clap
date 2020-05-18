class ClapsController < ApplicationController
  before_action :logged_in?, only: [:view, :reset]

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

  def reset
    Clap.all.each { |clap|
      clap.update(hidden: true)
    }

    flash[:success] = 'You reset counter!!'
    redirect_to view_path
  end

  def count_clap
    all_active_claps =
      Clap.all.
        reject { |clap| clap.hidden }.
        select { |clap| clap.hash_tag == hash_tag }

    @hash_tag = hash_tag
    @new_claps_count = all_active_claps.reject { |clap| clap.viewed }.count
    @active_claps = all_active_claps.sort_by{ |c| c.id }

    latest_sound = all_active_claps.last&.sound_name
    @sound = SOUND_LIST.include?(latest_sound) ? latest_sound : nil

    view!(all_active_claps)
    render partial: 'count_clap'
  end

  private

  def logged_in?
    redirect_to admin_login_path if cookies[:_clap_rails_admin].nil?
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
