# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title (page_title = "Consultoría en temas de desarrollo WEB y estrategia de TI",
            show_title = true)
    content_for(:head) { 
      content_tag(:title, "#{page_title.to_s} | Cristiancastillo.com")
    }
    @show_title = show_title
    if show_title?
      content_for(:title){ page_title }
    end
  end
  
  def show_title?
    @show_title
  end
  
  def description( d= "Consultoría y desarrollo de aplicaciones WEB, estratégia de negocios WEB, 
    marketing sobre WEB y temas relacionados con tecnologías de información, marketing y redes sociales")
    content_for(:head) {
      tag(:meta, :name => "description" ,:content=>h(d) )
    }
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  def lenguetas
    t = ""
    tabs({:always_link => true }) do |tab|
      t << tab.home( "Home", root_path)
      
      Categoria.menu.each do |c|
        t << eval("tab.#{c.nombre.parameterize("_")}(\"#{c.nombre}\", \"#{polymorphic_url([User.first,c])}\")")
      end
      
      t << tab.contacto( "Contacto", new_contacto_path)
    end
    t
  end
  
  #entrega las categorías con entradas
  def categorias
    t = ""
    Categoria.all(:order => "nombre", :conditions => "menu is false").each do |c|
      t << content_tag(:li, link_to(c.nombre, [c.user, c]))
    end
    content_tag :ul, t, :id => "categorias"
  end
  
  def add_this
    add_this = <<texto
    <!-- AddThis Button BEGIN -->
      <a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;username=ccastillop">
        <img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/>
      </a>
      <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=ccastillop"></script>
    <!-- AddThis Button END -->
texto
  end
  
  def truncate_words(text, length = 80, end_string = ' …')
    return if text.nil?
    text = strip_tags text
    words = text.split()
    words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end
  
  def google_analytics
    texto = <<javascript
    
    <script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
    try {
    var pageTracker = _gat._getTracker("UA-12865942-1");
    pageTracker._trackPageview();
    } catch(err) {}</script>
    
javascript
  end
  
    def facebook_like
      fb = <<facebook
      <iframe src="http://www.facebook.com/widgets/like.php?href=#{request.url}"
              scrolling="no" frameborder="0"
              style="border:none; width:170px; height:160px">
      </iframe>

facebook
    end
  
end
