slot.set_layout("custom")

                        ui.container {
                            attr = { class = "row" },
                            content = function()
                                ui.container {
                                    attr = { class = "col-md-12 well" },
                                    content = function()
                                        ui.container {
                                            attr = { class = "row" },
                                            content = function()
                                        ui.container {
                                            attr = { class = "col-md-3 col-md-offset-1" },
                                            content = function()
                                                ui.image { static = "png/committee_big.png" }
                                            end
                                        }
                                        ui.container {
                                            attr = { class = "col-md-8 text-center" },
                                            content = function()
                                                ui.container {
                                                    attr = { class = "row spaceline3" },
                                                    content = function()
                                                        ui.container {
                                                            attr = { class = "label label-warning text-center" },
                                                            content = function()
                                                                ui.heading { level = 1, attr = { class = "uppercase" }, content = function() slot.put(_ "PROPOSTA I129") end }
                                                            end
                                                        }
                                                    end
                                                }
                                            end
                                        }
                                            end
                                        }
                                        ui.container {
                                            attr = { class = "row" },
                                            content = function()
                                                ui.container {
                                                    attr = { class = "col-md-12" },
                                                    content = function()
                                                        
                                                            ui.image { attr = { class = "col-md-12", }, static = "png/commission_step_1.png" }
                                                     
                                     
                                                    end
                                                }
                                            end
                                        }
                                    end
                                }
                            end
                        }
																ui.container {
                                                    attr = { class = "row" },
                                                    content = function()
																				ui.container {
								                                        attr = { class = "col-md-12 well" },
								                                        content = function()
																						   ui.container {
														                               attr = { class = "row" },
														                               content = function()
																											ui.container {
																						                   attr = { class = "col-md-12 well-inside paper" },
																						                   content = function()  
ui.container {
                                    attr = { class = "row text-center" },
                                    content = function()
										                                         ui.container {
										                                             attr = { class = "label label-warning text-center" },
										                                             content = function()
										                                                 ui.heading { level = 1, attr = { class = "uppercase" }, content = function() slot.put(_ "Responsabilità delle imprese per gravi violazioni dei diritti umani") end }
										                                             end
										                                         }
										                                             end
										                                         }
                            ui.container {
                                attr = { class = "row spaceline2" },
                                content = function()
                                    ui.container {
                                        attr = { class = "col-md-6 text-justify" },
                                        content = function()
                                            ui.heading { level = 3, content = _ "Do you think that this initiative needs to be examined by experts? Click here to support the request for a technical committee to be summoned" }
                                        end
                                    }
                                    ui.container {
                                        attr = { class = "col-md-2 text-center" },
                                        content = function()
                                            ui.image { attr = { class = "arrow_big" }, static = "svg/arrow-right.svg" }
                                        end
                                    }
                                    --DA RIFARE: params sbagliati
                                    ui.container {
                                        attr = { class = "col-md-4 spaceline" },
                                        content = function()
                                            ui.link {
                                                attr = { class = "btn btn-primary btn_large text-center h3" },
                                                module = "committee",
                                                view = "summon",
                                                params = { initiative_id = initiative_id, field_keywords = field_keywords },
                                                content = function()
                                                    slot.put(_ "Summon a committee")
                                                end
                                            }
                                        end
                                    }
                                end
                            }
 										ui.container {
                                    attr = { class = "row" },
                                    content = function()
														ui.container {
																attr = { class = "col-md-6 spaceline" },
																content = function()
																ui.heading { level = 2, content = function() slot.put(_ "<hr><br><strong>Unita':</strong> Italia <br><strong>Area:</strong> Affari Esteri  <br><strong>Regola:</strong> Votazione semi-urgente (7gg) <br><strong>Questione sollevata il:</strong> 17/04/2016 10:04:03 ore") end }
																end
														}
														ui.container {
																attr = { class = "col-md-6 text-center spaceline3" },
																content = function()
																 ui.link {
																									  attr = { class = "btn btn-primary large_btn h3 spaceline3" },
																									  module = "committee",
																									  view = "view",
																									  params = { initiative_id = initiative_id },
																									  content = _ "Dettagli proposta"

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
