class PicattachmentController < ApplicationController


  

  def index
  end
    def new
    @picattachment = Picattachment.new
  end
def create
  @picattachment = @micropost.picattachments.build(picattachment_params)

end
  def destroy
    @picattachment.destroy
  end
private
   def picattachment_params
      params.require(:picattachment).permit(:micropost_id,:picture)
    end

end