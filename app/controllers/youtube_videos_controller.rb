class YoutubeVideosController < ApplicationController
  def index
    @youtube_videos = YoutubeVideo.all

    render("youtube_video_templates/index.html.erb")
  end

  def show
    @youtube_video = YoutubeVideo.find(params.fetch("id_to_display"))

    render("youtube_video_templates/show.html.erb")
  end

  def new_form
    render("youtube_video_templates/new_form.html.erb")
  end

  def create_row
    @youtube_video = YoutubeVideo.new

    @youtube_video.tab_id = params.fetch("tab_id")
    @youtube_video.url_link = params.fetch("url_link")
    @youtube_video.description = params.fetch("description")

    if @youtube_video.valid?
      @youtube_video.save

      redirect_to("/guides/"+params.fetch("guide_id").to_s, :notice => "Youtube video created successfully.")
    else
      render("/guides/"+params.fetch("guide_id").to_s)
    end
  end

  def edit_form
    @youtube_video = YoutubeVideo.find(params.fetch("prefill_with_id"))

    render("youtube_video_templates/edit_form.html.erb")
  end

  def update_row
    @youtube_video = YoutubeVideo.find(params.fetch("id_to_modify"))

    @youtube_video.tab_id = params.fetch("tab_id")
    @youtube_video.url_link = params.fetch("url_link")
    @youtube_video.description = params.fetch("description")

    if @youtube_video.valid?
      @youtube_video.save

      redirect_to("/youtube_videos/#{@youtube_video.id}", :notice => "Youtube video updated successfully.")
    else
      render("youtube_video_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @youtube_video = YoutubeVideo.find(params.fetch("id_to_remove"))

    @youtube_video.destroy

    redirect_to("/youtube_videos", :notice => "Youtube video deleted successfully.")
  end
end
