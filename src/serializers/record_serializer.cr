abstract class RecordSerializer < BaseSerializer
  abstract def render_base : NamedTuple
  abstract def render_expanded : NamedTuple

  def render
    return render_base unless @expand

    render_base.merge(render_expanded)
  end
end
