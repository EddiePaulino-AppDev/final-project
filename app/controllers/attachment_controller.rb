class attachmentsController < ApplicationController
   def index
      @attachments = attachment.all
   end
   
   def new
      @attachment = attachment.new
   end
   
   def create
      @attachment = attachment.new(attachment_params)
      
      if @attachment.save
         redirect_to attachments_path, notice: "The attachment #{@attachment.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @attachment = attachment.find(params[:id])
      @attachment.destroy
      redirect_to attachments_path, notice:  "The attachment #{@attachment.name} has been deleted."
   end
   
   private
      def attachment_params
      params.require(:attachment).permit(:name, :attachment)
   end
   
end