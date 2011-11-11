<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventproject_create extends Event{

		const ROOTELEMENT = 'project-create';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'Project: Create',
				'author' => array(
					'name' => 'Admin Admin',
					'website' => 'http://edelstall',
					'email' => 'noreply@churchdeploy.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2011-11-11T02:12:44+00:00',
				'trigger-condition' => 'action[project-create]'
			);
		}

		public static function getSource(){
			return '2';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;project-create result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/project-create></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;project-create result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/project-create></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Name
    &lt;!-- Modify just current language value -->
    &lt;input name="fields[name][value-{$url-language}]" type="text" /> 
    
    &lt;!-- Modify all values -->
    &lt;input name="fields[name][value-de]" type="text" />
    &lt;input name="fields[name][value-en]" type="text" />
  &lt;/label>
  &lt;label>Cover
    &lt;input name="fields[cover]" type="file" />
  &lt;/label>
  &lt;label>URL
    &lt;!-- Modify just current language value -->
    &lt;input name="fields[url][value-{$url-language}]" type="text" /> 
    
    &lt;!-- Modify all values -->
    &lt;input name="fields[url][value-de]" type="text" />
    &lt;input name="fields[url][value-en]" type="text" />
  &lt;/label>
  &lt;label>Description
    &lt;!-- Modify just current language value -->
    &lt;input name="fields[description][value-{$url-language}]" type="text" /> 
    
    &lt;!-- Modify all values -->
    &lt;input name="fields[description][value-de]" type="text" />
    &lt;input name="fields[description][value-en]" type="text" />
  &lt;/label>
  &lt;input name="fields[member]" type="hidden" value="..." />
  &lt;input name="action[project-create]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://edelstall/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['project-create'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}
