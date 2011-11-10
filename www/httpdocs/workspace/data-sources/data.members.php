<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcemembers extends Datasource{

		public $dsParamROOTELEMENT = 'members';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'full-name',
				'first-name',
				'middle-name',
				'last-name',
				'email',
				'password',
				'activation',
				'role',
				'role: permissions',
				'date-created',
				'gender'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Members',
				'author' => array(
					'name' => 'Admin Admin',
					'website' => 'http://churchdeploy',
					'email' => 'noreply@churchdeploy.com'),
				'version' => 'Symphony 2.2.4',
				'release-date' => '2011-11-01T22:45:48+00:00'
			);
		}

		public function getSource(){
			return '1';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
