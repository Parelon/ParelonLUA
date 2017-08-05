ui.container {
  attr = { class = "row" },
  content = function()
    ui.container {
      attr = { class = "col-md-12 well spaceline3" },
      content = function()
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.heading {
              attr = { class = "col-md-10 col-md-offset-1 text-center" },
              level = 3,
              content = _ "The summary of the status of all the issues in you are interested in is this:"
            }
          end
        }
        ui.container {
          attr = { class = "row" },
          content = function()
            ui.container {
              attr = { class = "col-md-12 well-inside paper text-center" },
              content = function()
                ui.container {
                  attr = { class = "row" },
                  content = function()
                    local issues_new_count = 0.0
                    local issues_discussion_count = 0.0
                    local issues_frozen_count = 0.0
                    local issues_voting_count = 0.0
                    local issues_finished_count = 0.0
                    local issues_canceled_count = 0.0
                    local status_selector = db:new_selector():from("area"):add_field("area.id"):add_field("(SELECT COUNT(*) FROM issue WHERE issue.area_id = area.id AND issue.state = 'admission')", "issues_new_count"):add_field("(SELECT COUNT(*) FROM issue WHERE issue.area_id = area.id AND issue.state = 'discussion')", "issues_discussion_count"):add_field("(SELECT COUNT(*) FROM issue WHERE issue.area_id = area.id AND issue.state = 'verification')", "issues_frozen_count"):add_field("(SELECT COUNT(*) FROM issue WHERE issue.area_id = area.id AND issue.state = 'voting')", "issues_voting_count"):add_field("(SELECT COUNT(*) FROM issue WHERE issue.area_id = area.id AND issue.fully_frozen NOTNULL AND issue.closed NOTNULL)", "issues_finished_count"):add_field("(SELECT COUNT(*) FROM issue WHERE issue.area_id = area.id AND issue.fully_frozen ISNULL AND issue.closed NOTNULL)", "issues_canceled_count"):join("issue", nil, { "area.id = issue.area_id AND area.active = TRUE" }):join("unit", nil, "unit.id = area.unit_id"):join("membership", nil, { "membership.area_id = area.id AND membership.member_id = ?", app.session.member.id }):add_group_by("area.id"):exec()
                    for i, k in ipairs(status_selector) do
                      issues_new_count = issues_new_count + k.issues_new_count
                      issues_discussion_count = issues_discussion_count + k.issues_discussion_count
                      issues_frozen_count = issues_frozen_count + k.issues_frozen_count
                      issues_voting_count = issues_voting_count + k.issues_voting_count
                      issues_finished_count = issues_finished_count + k.issues_finished_count
                      issues_canceled_count = issues_canceled_count + k.issues_canceled_count
                    end

                    ui.container {
                      attr = { class = "col-md-4 col-sm-6 col-xs-12" },
                      content = function()
                        ui.container {
                          attr = { class = "row spaceline-bottom" },
                          content = function()
                            ui.container {
                              attr = { class = "col-md-2 col-sm-4 col-xs-12 col-md-offset-1 spaceline" },
                              content = function()
                                ui.image {attr = { class = "icon-medium" },
                                  static = "png/new-proposal.png"
                                }
                              end
                            }
                            ui.link {
                              module = "issue",
                              view = "list",
                              params = {
                                filter_unit = "my_areas",
                                tab = "open",
                                filter_interest = "area",
                                filter = "new"
                              },
                              attr = { class = "col-md-9 col-sm-8 col-xs-12 text-center spaceline" },
                              content = function()
                                ui.heading {
                                  level = 4,
                                  attr = { class = "btn btn-primary large_btn_console" },
                                  content = _("#{count} new", { count = issues_new_count })
                                }
                              end
                            }
                          end
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "col-md-4 col-sm-6 col-xs-12" },
                      content = function()
                        ui.container {
                          attr = { class = "row spaceline-bottom" },
                          content = function()
                            ui.container {
                              attr = { class = "col-md-2 col-sm-4 col-xs-12 col-md-offset-1 spaceline" },
                              content = function()
                                ui.image {
                                  attr = { class = "icon-medium" },
                                  static = "png/discussion.png"
                                }
                              end
                            }
                            ui.link {
                              module = "issue",
                              view = "list",
                              params = {
                                filter_unit = "my_areas",
                                tab = "open",
                                filter_interest = "area",
                                filter = "accepted"
                              },
                              attr = { class = "col-md-9 col-sm-8 col-xs-12 text-center spaceline" },
                              content = function()
                                ui.heading {
                                  level = 4,
                                  attr = { class = "btn btn-primary large_btn_console" },
                                  content = _("#{count} in discussion", { count = issues_discussion_count })
                                }
                              end
                            }
                          end
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "col-md-4 col-sm-6 col-xs-12" },
                      content = function()
                        ui.container {
                          attr = { class = "row spaceline-bottom" },
                          content = function()
                            ui.container {
                              attr = { class = "col-md-2 col-sm-4 col-xs-12 col-md-offset-1 spaceline" },
                              content = function()
                                ui.image {
                                  attr = { class = "icon-medium" },
                                  static = "png/verification.png"
                                }
                              end
                            }
                            ui.link {
                              module = "issue",
                              view = "list",
                              params = {
                                filter_unit = "my_areas",
                                tab = "open",
                                filter_interest = "area",
                                filter = "half_frozen"
                              },
                              attr = { class = "col-md-9 col-sm-8 col-xs-12 text-center spaceline" },
                              content = function()
                                ui.heading {
                                  level = 4,
                                  attr = { class = "btn btn-primary large_btn_console" },
                                  content = _("#{count} in verification", { count = issues_frozen_count })
                                }
                              end
                            }
                          end
                        }
                      end
                    }

                    ui.container {
                      attr = { class = "col-md-4 col-sm-6 col-xs-12" },
                      content = function()
                        ui.container {
                          attr = { class = "row spaceline-bottom" },
                          content = function()
                            ui.container {
                              attr = { class = "col-md-2 col-sm-4 col-xs-12 col-md-offset-1 spaceline" },
                              content = function()
                                ui.image {
                                  attr = { class = "icon-medium" },
                                  static = "png/voting.png"
                                }
                              end
                            }
                            ui.link {
                              module = "issue",
                              view = "list",
                              params = {
                                filter_unit = "my_areas",
                                tab = "open",
                                filter_interest = "area",
                                filter = "frozen"
                              },
                              attr = { class = "col-md-9 col-sm-8 col-xs-12 text-center spaceline" },
                              content = function()
                                ui.heading {
                                  level = 4,
                                  attr = { class = "btn btn-primary large_btn_console" },
                                  content = _("#{count} in voting", { count = issues_voting_count })
                                }
                              end
                            }
                          end
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "col-md-4 col-sm-6 col-xs-12" },
                      content = function()
                        ui.container {
                          attr = { class = "row spaceline-bottom" },
                          content = function()
                            ui.container {
                              attr = { class = "col-md-2 col-sm-4 col-xs-12 col-md-offset-1 spaceline" },
                              content = function()
                                ui.image {
                                  attr = { class = "icon-medium" },
                                  static = "png/finished.png"
                                }
                              end
                            }
                            ui.link {
                              module = "issue",
                              view = "list",
                              params = {
                                filter_unit = "my_areas",
                                tab = "open",
                                filter_interest = "area",
                                filter = "finished"
                              },
                              attr = { class = "col-md-9 col-sm-8 col-xs-12 text-center spaceline" },
                              content = function()
                                ui.heading {
                                  level = 4,
                                  attr = { class = "btn btn-primary large_btn_console" },
                                  content = _("#{count} finished", { count = issues_finished_count })
                                }
                              end
                            }
                          end
                        }
                      end
                    }
                    ui.container {
                      attr = { class = "col-md-4 col-sm-6 col-xs-12" },
                      content = function()
                        ui.container {
                          attr = { class = "row spaceline-bottom" },
                          content = function()
                            ui.container {
                              attr = { class = "col-md-2 col-sm-4 col-xs-12 col-md-offset-1 spaceline" },
                              content = function()
                                ui.image {
                                  attr = { class = "icon-medium" },
                                  static = "png/delete.png"
                                }
                              end
                            }
                            ui.link {
                              module = "issue",
                              view = "list",
                              params = {
                                filter_unit = "my_areas",
                                tab = "open",
                                filter_interest = "area",
                                filter = "canceled"
                              },
                              attr = { class = "col-md-9 col-sm-8 col-xs-12 text-center spaceline" },
                              content = function()
                                ui.heading {
                                  level = 4,
                                  attr = { class = "btn btn-primary large_btn_console" },
                                  content = _("#{count} canceled", { count = issues_canceled_count })
                                }
                              end
                            }
                          end
                        }
                      end
                    }

                  end
                }
              end
            }
          end
        }
      end
    }
  end
}