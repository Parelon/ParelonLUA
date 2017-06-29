slot.set_layout("custom")
															   ui.container {
                                                            attr = { class = "row spaceline text-center" },
                                                            content = function()
                                                                        ui.tag {
																										 attr = {
																										     class = ""
																										 },
                                                               slot.put("<iframe src='http://sinatra.cirsfid.unibo.it/demo-akn/' width='100%' height='1000' border='none'> </iframe>")
                                                                        }
                                                                    end
                                                                }

