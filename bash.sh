    #!/bin/bash
            for BRANCH in $(git branch -r);
		            do
				                    if [[ $BRANCH =~ origin/([a-zA-Z0-9_-]+) && ! $BRANCH =~ origin/master ]]
							                    then
										                            BRANCH=${BRANCH#origin\/}
													                            git checkout $BRANCH;
																                            git merge origin/master;
																			                            git push $BRANCH;
																						                    fi;
																								            done;
