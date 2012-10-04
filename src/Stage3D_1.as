package
{
	import away3d.containers.*;
	import away3d.entities.Mesh;
	import away3d.lights.DirectionalLight;
	import away3d.materials.ColorMaterial;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.primitives.SphereGeometry;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.*;
	import flash.geom.Vector3D;
	
	[SWF(width="465", height="465", frameRate="60")]
	public class Stage3D_1 extends Sprite
	{	
		private var view:View3D;
		private var material:ColorMaterial;
		private var geometory1:SphereGeometry;
		private var geometory2:SphereGeometry;
		private var geometory3:SphereGeometry;
		private var geometory4:SphereGeometry;
		private var mesh1:Mesh;
		private var mesh2:Mesh;
		private var mesh3:Mesh;
		private var mesh4:Mesh;
		private var light:DirectionalLight;
		
		public function Stage3D_1()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			init();
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function init():void{
			
			view = new View3D();
			addChild(view);
			
			view.camera.z = -2000;
			
			light = new DirectionalLight();
			view.scene.addChild(light);
			
			var lightPicker:StaticLightPicker = new StaticLightPicker([light]);
			
			material = new ColorMaterial(0xFFFFFF);
			geometory1 = new SphereGeometry(300, 5, 5);
			geometory2 = new SphereGeometry(300, 10, 10);
			geometory3 = new SphereGeometry(300, 15, 15);
			geometory4 = new SphereGeometry(300, 20, 20);
			mesh1 = new Mesh(geometory1, material);
			mesh2 = new Mesh(geometory2, material);
			mesh3 = new Mesh(geometory3, material);
			mesh4 = new Mesh(geometory4, material);
			
			material.lightPicker = lightPicker;

			mesh1.position = new Vector3D(-500, 500, 0);
			mesh2.position = new Vector3D(500, 500, 0);
			mesh3.position = new Vector3D(-500, -500, 0);
			mesh4.position = new Vector3D(500, -500, 0);
			
			view.scene.addChild(mesh1);
			view.scene.addChild(mesh2);
			view.scene.addChild(mesh3);
			view.scene.addChild(mesh4);
			
			light.direction = new Vector3D(0, 0, 1);
			light.specular = 0;
			
		}
		
		private function loop(e:Event):void{
			
			mesh1.rotationY += 2;
			mesh2.rotationY += 2;
			mesh3.rotationY += 2;
			mesh4.rotationY += 2;
			
//			light.direction = new Vector3D(0, 0, 1);
			
			view.render();
		}
	}
}