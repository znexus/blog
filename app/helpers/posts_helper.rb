module PostsHelper
  def to_html(text, ancho = :large)
    #procesado del texto.
    #existen imágenes
    #text = text.pandoku(:markdown => :html)
    
    #text = (text.blank? ? "" : Maruku.new(text).to_html)
    text = text.pandoku(:markdown, :html)
    text.gsub!(/figura_([0-9]+)/) do |id|
      #begin
        f = Figura.find($1.to_i)
        render_figura(f, ancho)
      #rescue
      #  content_tag(:p, "-figura no encontrada-",:class=>:error)
      #end
    end
    text
  end
  
  def render_figura(figura, ancho)
    content_tag(:div, 
      [ content_tag(:p, link_to( image_tag(figura.img.url(ancho), :alt => figura, :title=>figura ),  [figura.post,figura], :class=>"box" ), :class => :art),
        content_tag(:p, figura.nombre, :class => :caption),
        content_tag(:p, figura.descripcion, :class => :nota) ].join("\n"),
      :id => figura,
      :class => "figure"
    )
  end
end
