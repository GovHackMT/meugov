module ProposalsHelper
  def proposals_as_json(proposals)
    proposals.collect do |proposal|
      {
        id: proposal.id,
        lat: proposal.city.latitude,
        lng: proposal.city.longitude,
        title: proposal.title,
        city: proposal.city.name_with_state,
        area: proposal.proposal_category.name,
        icon: 'icon_blue.png',
        link: proposal_path(proposal)
      }
    end.to_json.html_safe
  end

  def thermometer_progress(total)
    total ||= 0
    if total > 66.66
      css_class = 'progress-bar-success'
    elsif total > 33.33 and total < 66.66
      css_class = 'progress-bar-warning'
    else
      css_class = 'progress-bar-danger'
    end

    css_class
  end

  def proposal_class(total)
    total ||= 0
    if total > 66.66
      css_class = 'proposta-success'
    elsif total > 33.33 and total < 66.66
      css_class = 'proposta-warning'
    else
      css_class = 'proposta-danger'
    end

    css_class
  end
end
