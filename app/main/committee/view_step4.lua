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
                                                        
                                                            ui.image { attr = { class = "col-md-12", }, static = "png/commission_step_5.png" }
                                                     
                                     
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
														                               attr = { class = "row" },
														                               content = function()
																															 ui.container {
																																  attr = { class = "col-md-2 text-right" },
																																  content = function()
																																		ui.image { static = "png/committee.png" }
																																  end
																															 }
																						               ui.container {
																						                   attr = { class = "col-md-9 spaceline3 " },
																						                   content = function()
																						                       ui.heading { level = 3, content = function() slot.put(_ "La commissione Tecnica sta esaminando la proposta ed è composta da:<br><hr>") end }
																						                   end
																						               }
																						                   end
																						               }
																						   ui.container {
														                               attr = { class = "row" },
														                               content = function()

																															 ui.container {
																																  attr = { class = "col-md-2 text-right" },
																																  content = function()
																																		ui.image { static = "io.jpg" }
																																  end
																															 }
																						               ui.container {
																						                   attr = { class = "col-md-6 spaceline2 " },
																						                   content = function()
																						                       ui.heading { level = 3, content = function() slot.put(_ "Giuseppe Rossi: Ingegnere Edile") end }
																						                   end
																						               }
                   ui.container {
                        attr = { class = "col-md-4" },
                        content = function()
                            ui.link {
                                attr = { class = "btn btn-primary large_btn" },
                                module = "committee",
                                view = "view",
                                params = { initiative_id = initiative_id },
                                content = _ "Segnala conflitto"
                            }
                            ui.link {
                                attr = { class = "btn btn-primary large_btn spaceline" },
                                module = "committee",
                                view = "view",
                                params = { initiative_id = initiative_id },
                                content = _ "Vedi profilo"
                            }
                        end
                    }															                   end
																						               }
			   ui.container {
														                               attr = { class = "row spaceline2" },
														                               content = function()

																															 ui.container {
																																  attr = { class = "col-md-2 text-right" },
																																  content = function()
																																		ui.image { static = "apiano.jpg" }
																																  end
																															 }
																						               ui.container {
																						                   attr = { class = "col-md-6 spaceline2 " },
																						                   content = function()
																						                       ui.heading { level = 3, content = function() slot.put(_ "Francesco Neri: Consulente finanziario") end }
																						                   end
																						               }
                   ui.container {
                        attr = { class = "col-md-4" },
                        content = function()
                            ui.link {
                                attr = { class = "btn btn-primary large_btn" },
                                module = "committee",
                                view = "view",
                                params = { initiative_id = initiative_id },
                                content = _ "Segnala conflitto"
                            }

                            ui.link {
                                attr = { class = "btn btn-primary large_btn spaceline" },
                                module = "committee",
                                view = "view",
                                params = { initiative_id = initiative_id },
                                content = _ "Vedi profilo"
                            }
                        end
                    }															                   end
																						               }
			   ui.container {
														                               attr = { class = "row spaceline2" },
														                               content = function()

																															 ui.container {
																																  attr = { class = "col-md-2 text-right" },
																																  content = function()
																																		ui.image { static = "vabate.jpg" }
																																  end
																															 }
																						               ui.container {
																						                   attr = { class = "col-md-6 spaceline2 " },
																						                   content = function()
																						                       ui.heading { level = 3, content = function() slot.put(_ "Vincenzo Lusi: Informatico") end }
																						                   end
																						               }
                   ui.container {
                        attr = { class = "col-md-4" },
                        content = function()
                            ui.link {
                                attr = { class = "btn btn-primary large_btn" },
                                module = "committee",
                                view = "view",
                                params = { initiative_id = initiative_id },
                                content = _ "Segnala conflitto"
                            }

                            ui.link {
                                attr = { class = "btn btn-primary large_btn spaceline" },
                                module = "committee",
                                view = "view",
                                params = { initiative_id = initiative_id },
                                content = _ "Vedi profilo"
                            }
                        end
                    }															                   end
																						               }
			 			
														                               end
														                           }
								                         
								                                        end
								                                    }
                                                    end
                                                }
																						                   end
																						               }
