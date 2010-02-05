module ComentariosHelper
  def nuevo_comentario
    c = Comentario.new
    c.post = @post
    if user_signed_in?
      c.user = current_user
      c.email = current_user.email
      c.web = current_user.web
    end
    @comentario = c
    render :partial => "comentarios/form" 
  end
end
