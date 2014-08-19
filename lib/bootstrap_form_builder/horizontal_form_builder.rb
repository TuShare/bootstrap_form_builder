# A form build that adheres to Bootstrap horizontal form conventions.
#
class BootstrapFormBuilder::HorizontalFormBuilder < ActionView::Helpers::FormBuilder
  def email_field(name, opts = {})
    form_group(name) do
      super(name, opts.reverse_merge(:class => 'form-control',
                                     :placeholder => help(name)))
    end
  end

  def text_field(name, opts = {})
    form_group(name) do
      super(name, opts.reverse_merge(:class => 'form-control',
                                     :placeholder => help(name)))
    end
  end

  def password_field(name, opts = {})
    form_group(name) do
      super(name, opts.reverse_merge(:class => 'form-control',
                                     :placeholder => help(name)))
    end
  end

  def date_field(name, opts = {})
    form_group(name) do
      super(name, opts.reverse_merge(:class => 'form-control',
                                     :placeholder => help(name)))
    end
  end

  def number_field(name, opts = {})
    form_group(name) do
      super(name, opts.reverse_merge(:class => 'form-control',
                                     :placeholder => help(name)))
    end
  end

  def check_box(name, opts = {})
    form_group(name) do
      super(name, opts.reverse_merge(:class => 'form-control',
                                     :placeholder => help(name)))
    end
  end

  def radio_button_group(name, button_options, opts = {})
    form_group(name) do
      buttons = button_options.map do |button|
        label(name, :value => button, :class => 'btn btn-default') do
          radio_button(name, button) +
            I18n.t("#{object_name}.#{name}_options.#{button}",
                   :scope => "helpers.label")
        end
      end.join("\n").html_safe

      @template.content_tag(:div,
                            buttons,
                            :class => 'btn-group',
                            :data => { :toggle => 'buttons' })
    end
  end

  def select(name, choices, options = {}, html_options = {})
    form_group(name) do
      super(name, choices, options, html_options.reverse_merge(:class => 'form-control'))
    end
  end

  def text_area(name, opts = {})
    form_group(name) do
      super(name, opts.reverse_merge(:class => 'form-control',
                                     :placeholder => help(name)))
    end
  end

  def form_group(name, &block)
    classes = ['form-group']

    if @object.errors.has_key?(name)
      classes << 'has-error'
    end

    @template.content_tag(:div,
                          label(name) +
                          col_wrap(block.call + errors(name)),
                          :class => classes.join(' '))
  end

  def col_wrap(html)
    @template.content_tag(:div, html, :class => 'col-sm-7')
  end

  def label(name, opts = {})
    super(name, opts.reverse_merge(:class => 'col-sm-3 control-label'))
  end

  def errors(name)
    if @object.errors.has_key?(name)
      errors = @object.errors.full_messages_for(name).join('. ')
      @template.content_tag(:span, errors, :class => 'help-text text-danger')
    else
      ''
    end
  end

  def help(name)
    i18n_name = "helpers.hints.#{object_name}.#{name}"
    if I18n.exists?(i18n_name)
      I18n.t(i18n_name)
    else
      nil
    end
  end

  def cancel_button(cancel_path)
    @template.link_to(I18n.t('helpers.button.cancel'),
                      cancel_path,
                      :class => 'btn btn-default')
  end

  def submit_button(label = "")
    @template.content_tag(:div,
                          @template.
                            content_tag(:div,
                                        submit(label, :class => 'btn btn-primary'),
                                        :class => 'col-sm-offset-3 col-sm-7'),
                          :class => 'form-group')
  end

  def submit_and_cancel(cancel_path)
    @template.content_tag(:div,
                          @template.
                            content_tag(:div,
                                        submit(:class => 'btn btn-primary') +
                                        " " + cancel_button(cancel_path),
                                        :class => 'col-sm-offset-3 col-sm-7'),
                          :class => 'form-group')
  end
end
