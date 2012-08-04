// This file is hand mangled of a ODE header file.
// See copyright in src/ode/ode.d (BSD).
module lib.ode.loader;


version(DynamicODE)
{
import lib.loader;
import lib.ode.ode;


void loadODE(Loader l)
{
	loadODE_Objects(l);
	loadODE_Mass(l);
	loadODE_Collision(l);
	loadODE_CollisionTrimesh(l);
	loadODE_Space(l);
	loadODE_Common(l);
	loadODE_Init(l);
}

private:
void loadODE_Collision(Loader l)
{
	loadFunc!(dGeomDestroy)(l);
	loadFunc!(dGeomSetData)(l);
	loadFunc!(dGeomGetData)(l);
	loadFunc!(dGeomSetBody)(l);
	loadFunc!(dGeomGetBody)(l);
	loadFunc!(dGeomSetPosition)(l);
	loadFunc!(dGeomSetRotation)(l);
	loadFunc!(dGeomSetQuaternion)(l);
	loadFunc!(dGeomGetPosition)(l);
	loadFunc!(dGeomCopyPosition)(l);
	loadFunc!(dGeomGetRotation)(l);
	loadFunc!(dGeomCopyRotation)(l);
	loadFunc!(dGeomGetQuaternion)(l);
	loadFunc!(dGeomGetAABB)(l);
	loadFunc!(dGeomIsSpace)(l);
	loadFunc!(dGeomGetSpace)(l);
	loadFunc!(dGeomGetClass)(l);
	loadFunc!(dGeomSetCategoryBits)(l);
	loadFunc!(dGeomSetCollideBits)(l);
	loadFunc!(dGeomGetCategoryBits)(l);
	loadFunc!(dGeomGetCollideBits)(l);
	loadFunc!(dGeomEnable)(l);
	loadFunc!(dGeomDisable)(l);
	loadFunc!(dGeomIsEnabled)(l);
	loadFunc!(dGeomSetOffsetPosition)(l);
	loadFunc!(dGeomSetOffsetRotation)(l);
	loadFunc!(dGeomSetOffsetQuaternion)(l);
	loadFunc!(dGeomSetOffsetWorldPosition)(l);
	loadFunc!(dGeomSetOffsetWorldRotation)(l);
	loadFunc!(dGeomSetOffsetWorldQuaternion)(l);
	loadFunc!(dGeomClearOffset)(l);
	loadFunc!(dGeomIsOffset)(l);
	loadFunc!(dGeomGetOffsetPosition)(l);
	loadFunc!(dGeomCopyOffsetPosition)(l);
	loadFunc!(dGeomGetOffsetRotation)(l);
	loadFunc!(dGeomCopyOffsetRotation)(l);
	loadFunc!(dGeomGetOffsetQuaternion)(l);
	loadFunc!(dCollide)(l);
	loadFunc!(dSpaceCollide)(l);
	loadFunc!(dSpaceCollide2)(l);
	loadFunc!(dCreateSphere)(l);
	loadFunc!(dGeomSphereSetRadius)(l);
	loadFunc!(dGeomSphereGetRadius)(l);
	loadFunc!(dGeomSpherePointDepth)(l);
	loadFunc!(dCreateConvex)(l);
	loadFunc!(dGeomSetConvex)(l);
	loadFunc!(dCreateBox)(l);
	loadFunc!(dGeomBoxSetLengths)(l);
	loadFunc!(dGeomBoxGetLengths)(l);
	loadFunc!(dGeomBoxPointDepth)(l);
	loadFunc!(dCreatePlane)(l);
	loadFunc!(dGeomPlaneSetParams)(l);
	loadFunc!(dGeomPlaneGetParams)(l);
	loadFunc!(dGeomPlanePointDepth)(l);
	loadFunc!(dCreateCapsule)(l);
	loadFunc!(dGeomCapsuleSetParams)(l);
	loadFunc!(dGeomCapsuleGetParams)(l);
	loadFunc!(dGeomCapsulePointDepth)(l);
	loadFunc!(dCreateCylinder)(l);
	loadFunc!(dGeomCylinderSetParams)(l);
	loadFunc!(dGeomCylinderGetParams)(l);
	loadFunc!(dCreateRay)(l);
	loadFunc!(dGeomRaySetLength)(l);
	loadFunc!(dGeomRayGetLength)(l);
	loadFunc!(dGeomRaySet)(l);
	loadFunc!(dGeomRayGet)(l);
	loadFunc!(dGeomRaySetParams)(l);
	loadFunc!(dGeomRayGetParams)(l);
	loadFunc!(dGeomRaySetClosestHit)(l);
	loadFunc!(dGeomRayGetClosestHit)(l);
	loadFunc!(dCreateGeomTransform)(l);
	loadFunc!(dGeomTransformSetGeom)(l);
	loadFunc!(dGeomTransformGetGeom)(l);
	loadFunc!(dGeomTransformSetCleanup)(l);
	loadFunc!(dGeomTransformGetCleanup)(l);
	loadFunc!(dGeomTransformSetInfo)(l);
	loadFunc!(dGeomTransformGetInfo)(l);
	loadFunc!(dCreateHeightfield)(l);
	loadFunc!(dGeomHeightfieldDataCreate)(l);
	loadFunc!(dGeomHeightfieldDataDestroy)(l);
	loadFunc!(dGeomHeightfieldDataBuildCallback)(l);
	loadFunc!(dGeomHeightfieldDataBuildByte)(l);
	loadFunc!(dGeomHeightfieldDataBuildShort)(l);
	loadFunc!(dGeomHeightfieldDataBuildSingle)(l);
	loadFunc!(dGeomHeightfieldDataBuildDouble)(l);
	loadFunc!(dGeomHeightfieldDataSetBounds)(l);
	loadFunc!(dGeomHeightfieldSetHeightfieldData)(l);
	loadFunc!(dGeomHeightfieldGetHeightfieldData)(l);
	loadFunc!(dClosestLineSegmentPoints)(l);
	loadFunc!(dBoxTouchesBox)(l);
	loadFunc!(dBoxBox)(l);
	loadFunc!(dInfiniteAABB)(l);
	loadFunc!(dCloseODE)(l);
	loadFunc!(dCreateGeomClass)(l);
	loadFunc!(dGeomGetClassData)(l);
	loadFunc!(dCreateGeom)(l);
}

void loadODE_CollisionTrimesh(Loader l)
{
	loadFunc!(dGeomTriMeshDataCreate)(l);
	loadFunc!(dGeomTriMeshDataDestroy)(l);
	loadFunc!(dGeomTriMeshDataSet)(l);
	loadFunc!(dGeomTriMeshDataGet)(l);
	loadFunc!(dGeomTriMeshSetLastTransform)(l);
	loadFunc!(dGeomTriMeshGetLastTransform)(l);
	loadFunc!(dGeomTriMeshDataBuildSingle)(l);
	loadFunc!(dGeomTriMeshDataBuildSingle1)(l);
	loadFunc!(dGeomTriMeshDataBuildDouble)(l);
	loadFunc!(dGeomTriMeshDataBuildDouble1)(l);
	loadFunc!(dGeomTriMeshDataBuildSimple)(l);
	loadFunc!(dGeomTriMeshDataBuildSimple1)(l);
	loadFunc!(dGeomTriMeshDataPreprocess)(l);
	loadFunc!(dGeomTriMeshDataGetBuffer)(l);
	loadFunc!(dGeomTriMeshDataSetBuffer)(l);
	loadFunc!(dGeomTriMeshSetCallback)(l);
	loadFunc!(dGeomTriMeshGetCallback)(l);
	loadFunc!(dGeomTriMeshSetArrayCallback)(l);
	loadFunc!(dGeomTriMeshGetArrayCallback)(l);
	loadFunc!(dGeomTriMeshSetRayCallback)(l);
	loadFunc!(dGeomTriMeshGetRayCallback)(l);
	loadFunc!(dCreateTriMesh)(l);
	loadFunc!(dGeomTriMeshSetData)(l);
	loadFunc!(dGeomTriMeshGetData)(l);
	loadFunc!(dGeomTriMeshEnableTC)(l);
	loadFunc!(dGeomTriMeshIsTCEnabled)(l);
	loadFunc!(dGeomTriMeshClearTCCache)(l);
	loadFunc!(dGeomTriMeshGetTriMeshDataID)(l);
	loadFunc!(dGeomTriMeshGetTriangle)(l);
	loadFunc!(dGeomTriMeshGetPoint)(l);
	loadFunc!(dGeomTriMeshGetTriangleCount)(l);
	loadFunc!(dGeomTriMeshDataUpdate)(l);
}

void loadODE_Common(Loader l)
{
	loadFunc!(dGeomMoved)(l);
	loadFunc!(dGeomGetBodyNext)(l);
}

void loadODE_Init(Loader l)
{
	loadFunc!(dInitODE)(l);
	loadFunc!(dInitODE2)(l);
	loadFunc!(dAllocateODEDataForThread)(l);
}

void loadODE_Mass(Loader l)
{
	loadFunc!(dMassCheck)(l);
	loadFunc!(dMassSetZero)(l);
	loadFunc!(dMassSetParameters)(l);
	loadFunc!(dMassSetSphere)(l);
	loadFunc!(dMassSetSphereTotal)(l);
	loadFunc!(dMassSetCapsule)(l);
	loadFunc!(dMassSetCapsuleTotal)(l);
	loadFunc!(dMassSetCylinder)(l);
	loadFunc!(dMassSetCylinderTotal)(l);
	loadFunc!(dMassSetBox)(l);
	loadFunc!(dMassSetBoxTotal)(l);
	loadFunc!(dMassSetTrimesh)(l);
//	loadFunc!(dMassSetTrimeshTotal)(l);
	loadFunc!(dMassAdjust)(l);
	loadFunc!(dMassTranslate)(l);
	loadFunc!(dMassRotate)(l);
	loadFunc!(dMassAdd)(l);
}

void loadODE_Objects(Loader l)
{
	loadFunc!(dWorldCreate)(l);
	loadFunc!(dWorldDestroy)(l);
	loadFunc!(dWorldSetGravity)(l);
	loadFunc!(dWorldGetGravity)(l);
	loadFunc!(dWorldSetERP)(l);
	loadFunc!(dWorldGetERP)(l);
	loadFunc!(dWorldSetCFM)(l);
	loadFunc!(dWorldGetCFM)(l);
	loadFunc!(dWorldStep)(l);
	loadFunc!(dWorldImpulseToForce)(l);
	loadFunc!(dWorldQuickStep)(l);
	loadFunc!(dWorldSetQuickStepNumIterations)(l);
	loadFunc!(dWorldGetQuickStepNumIterations)(l);
	loadFunc!(dWorldSetQuickStepW)(l);
	loadFunc!(dWorldGetQuickStepW)(l);
	loadFunc!(dWorldSetContactMaxCorrectingVel)(l);
	loadFunc!(dWorldGetContactMaxCorrectingVel)(l);
	loadFunc!(dWorldSetContactSurfaceLayer)(l);
	loadFunc!(dWorldGetContactSurfaceLayer)(l);
	loadFunc!(dWorldStepFast1)(l);
	loadFunc!(dWorldSetAutoEnableDepthSF1)(l);
	loadFunc!(dWorldGetAutoEnableDepthSF1)(l);
	loadFunc!(dWorldGetAutoDisableLinearThreshold)(l);
	loadFunc!(dWorldSetAutoDisableLinearThreshold)(l);
	loadFunc!(dWorldGetAutoDisableAngularThreshold)(l);
	loadFunc!(dWorldSetAutoDisableAngularThreshold)(l);
//	loadFunc!(dWorldGetAutoDisableLinearAverageThreshold)(l);
//	loadFunc!(dWorldSetAutoDisableLinearAverageThreshold)(l);
//	loadFunc!(dWorldGetAutoDisableAngularAverageThreshold)(l);
//	loadFunc!(dWorldSetAutoDisableAngularAverageThreshold)(l);
	loadFunc!(dWorldGetAutoDisableAverageSamplesCount)(l);
	loadFunc!(dWorldSetAutoDisableAverageSamplesCount)(l);
	loadFunc!(dWorldGetAutoDisableSteps)(l);
	loadFunc!(dWorldSetAutoDisableSteps)(l);
	loadFunc!(dWorldGetAutoDisableTime)(l);
	loadFunc!(dWorldSetAutoDisableTime)(l);
	loadFunc!(dWorldGetAutoDisableFlag)(l);
	loadFunc!(dWorldSetAutoDisableFlag)(l);
	loadFunc!(dBodyGetAutoDisableLinearThreshold)(l);
	loadFunc!(dBodySetAutoDisableLinearThreshold)(l);
	loadFunc!(dBodyGetAutoDisableAngularThreshold)(l);
	loadFunc!(dBodySetAutoDisableAngularThreshold)(l);
	loadFunc!(dBodyGetAutoDisableAverageSamplesCount)(l);
	loadFunc!(dBodySetAutoDisableAverageSamplesCount)(l);
	loadFunc!(dBodyGetAutoDisableSteps)(l);
	loadFunc!(dBodySetAutoDisableSteps)(l);
	loadFunc!(dBodyGetAutoDisableTime)(l);
	loadFunc!(dBodySetAutoDisableTime)(l);
	loadFunc!(dBodyGetAutoDisableFlag)(l);
	loadFunc!(dBodySetAutoDisableFlag)(l);
	loadFunc!(dBodySetAutoDisableDefaults)(l);
	loadFunc!(dBodyGetWorld)(l);
	loadFunc!(dBodyCreate)(l);
	loadFunc!(dBodyDestroy)(l);
	loadFunc!(dBodySetData)(l);
	loadFunc!(dBodyGetData)(l);
	loadFunc!(dBodySetPosition)(l);
	loadFunc!(dBodySetRotation)(l);
	loadFunc!(dBodySetQuaternion)(l);
	loadFunc!(dBodySetLinearVel)(l);
	loadFunc!(dBodySetAngularVel)(l);
	loadFunc!(dBodyGetPosition)(l);
	loadFunc!(dBodyCopyPosition)(l);
	loadFunc!(dBodyGetRotation)(l);
	loadFunc!(dBodyCopyRotation)(l);
	loadFunc!(dBodyGetQuaternion)(l);
	loadFunc!(dBodyCopyQuaternion)(l);
	loadFunc!(dBodyGetLinearVel)(l);
	loadFunc!(dBodyGetAngularVel)(l);
	loadFunc!(dBodySetMass)(l);
	loadFunc!(dBodyGetMass)(l);
	loadFunc!(dBodyAddForce)(l);
	loadFunc!(dBodyAddTorque)(l);
	loadFunc!(dBodyAddRelForce)(l);
	loadFunc!(dBodyAddRelTorque)(l);
	loadFunc!(dBodyAddForceAtPos)(l);
	loadFunc!(dBodyAddForceAtRelPos)(l);
	loadFunc!(dBodyAddRelForceAtPos)(l);
	loadFunc!(dBodyAddRelForceAtRelPos)(l);
	loadFunc!(dBodyGetForce)(l);
	loadFunc!(dBodyGetTorque)(l);
	loadFunc!(dBodySetForce)(l);
	loadFunc!(dBodySetTorque)(l);
	loadFunc!(dBodyGetRelPointPos)(l);
	loadFunc!(dBodyGetRelPointVel)(l);
	loadFunc!(dBodyGetPointVel)(l);
	loadFunc!(dBodyGetPosRelPoint)(l);
	loadFunc!(dBodyVectorToWorld)(l);
	loadFunc!(dBodyVectorFromWorld)(l);
	loadFunc!(dBodySetFiniteRotationMode)(l);
	loadFunc!(dBodySetFiniteRotationAxis)(l);
	loadFunc!(dBodyGetFiniteRotationMode)(l);
	loadFunc!(dBodyGetFiniteRotationAxis)(l);
	loadFunc!(dBodyGetNumJoints)(l);
	loadFunc!(dBodyGetJoint)(l);
	loadFunc!(dBodyEnable)(l);
	loadFunc!(dBodyDisable)(l);
	loadFunc!(dBodyIsEnabled)(l);
	loadFunc!(dBodySetGravityMode)(l);
	loadFunc!(dBodyGetGravityMode)(l);
	loadFunc!(dJointCreateBall)(l);
	loadFunc!(dJointCreateHinge)(l);
	loadFunc!(dJointCreateSlider)(l);
	loadFunc!(dJointCreateContact)(l);
	loadFunc!(dJointCreateHinge2)(l);
	loadFunc!(dJointCreateUniversal)(l);
	loadFunc!(dJointCreatePR)(l);
	loadFunc!(dJointCreateFixed)(l);
	loadFunc!(dJointCreateNull)(l);
	loadFunc!(dJointCreateAMotor)(l);
	loadFunc!(dJointCreateLMotor)(l);
	loadFunc!(dJointCreatePlane2D)(l);
	loadFunc!(dJointDestroy)(l);
	loadFunc!(dJointGroupCreate)(l);
	loadFunc!(dJointGroupDestroy)(l);
	loadFunc!(dJointGroupEmpty)(l);
	loadFunc!(dJointAttach)(l);
	loadFunc!(dJointSetData)(l);
	loadFunc!(dJointGetData)(l);
	loadFunc!(dJointGetType)(l);
	loadFunc!(dJointGetBody)(l);
	loadFunc!(dJointSetFeedback)(l);
	loadFunc!(dJointGetFeedback)(l);
	loadFunc!(dJointSetBallAnchor)(l);
	loadFunc!(dJointSetBallAnchor2)(l);
//	loadFunc!(dJointSetBallParam)(l);
	loadFunc!(dJointSetHingeAnchor)(l);
	loadFunc!(dJointSetHingeAnchorDelta)(l);
	loadFunc!(dJointSetHingeAxis)(l);
	loadFunc!(dJointSetHingeParam)(l);
	loadFunc!(dJointAddHingeTorque)(l);
	loadFunc!(dJointSetSliderAxis)(l);
	loadFunc!(dJointSetSliderAxisDelta)(l);
	loadFunc!(dJointSetSliderParam)(l);
	loadFunc!(dJointAddSliderForce)(l);
	loadFunc!(dJointSetHinge2Anchor)(l);
	loadFunc!(dJointSetHinge2Axis1)(l);
	loadFunc!(dJointSetHinge2Axis2)(l);
	loadFunc!(dJointSetHinge2Param)(l);
	loadFunc!(dJointAddHinge2Torques)(l);
	loadFunc!(dJointSetUniversalAnchor)(l);
	loadFunc!(dJointSetUniversalAxis1)(l);
	loadFunc!(dJointSetUniversalAxis2)(l);
	loadFunc!(dJointSetUniversalParam)(l);
	loadFunc!(dJointAddUniversalTorques)(l);
	loadFunc!(dJointSetPRAnchor)(l);
	loadFunc!(dJointSetPRAxis1)(l);
	loadFunc!(dJointSetPRAxis2)(l);
	loadFunc!(dJointSetPRParam)(l);
	loadFunc!(dJointAddPRTorque)(l);
	loadFunc!(dJointSetFixed)(l);
//	loadFunc!(dJointSetFixedParam)(l);
	loadFunc!(dJointSetAMotorNumAxes)(l);
	loadFunc!(dJointSetAMotorAxis)(l);
	loadFunc!(dJointSetAMotorAngle)(l);
	loadFunc!(dJointSetAMotorParam)(l);
	loadFunc!(dJointSetAMotorMode)(l);
	loadFunc!(dJointAddAMotorTorques)(l);
	loadFunc!(dJointSetLMotorNumAxes)(l);
	loadFunc!(dJointSetLMotorAxis)(l);
	loadFunc!(dJointSetLMotorParam)(l);
	loadFunc!(dJointSetPlane2DXParam)(l);
	loadFunc!(dJointSetPlane2DYParam)(l);
	loadFunc!(dJointSetPlane2DAngleParam)(l);
	loadFunc!(dJointGetBallAnchor)(l);
	loadFunc!(dJointGetBallAnchor2)(l);
//	loadFunc!(dJointGetBallParam)(l);
	loadFunc!(dJointGetHingeAnchor)(l);
	loadFunc!(dJointGetHingeAnchor2)(l);
	loadFunc!(dJointGetHingeAxis)(l);
	loadFunc!(dJointGetHingeParam)(l);
	loadFunc!(dJointGetHingeAngle)(l);
	loadFunc!(dJointGetHingeAngleRate)(l);
	loadFunc!(dJointGetSliderPosition)(l);
	loadFunc!(dJointGetSliderPositionRate)(l);
	loadFunc!(dJointGetSliderAxis)(l);
	loadFunc!(dJointGetSliderParam)(l);
	loadFunc!(dJointGetHinge2Anchor)(l);
	loadFunc!(dJointGetHinge2Anchor2)(l);
	loadFunc!(dJointGetHinge2Axis1)(l);
	loadFunc!(dJointGetHinge2Axis2)(l);
	loadFunc!(dJointGetHinge2Param)(l);
	loadFunc!(dJointGetHinge2Angle1)(l);
	loadFunc!(dJointGetHinge2Angle1Rate)(l);
	loadFunc!(dJointGetHinge2Angle2Rate)(l);
	loadFunc!(dJointGetUniversalAnchor)(l);
	loadFunc!(dJointGetUniversalAnchor2)(l);
	loadFunc!(dJointGetUniversalAxis1)(l);
	loadFunc!(dJointGetUniversalAxis2)(l);
	loadFunc!(dJointGetUniversalParam)(l);
	loadFunc!(dJointGetUniversalAngles)(l);
	loadFunc!(dJointGetUniversalAngle1)(l);
	loadFunc!(dJointGetUniversalAngle2)(l);
	loadFunc!(dJointGetUniversalAngle1Rate)(l);
	loadFunc!(dJointGetUniversalAngle2Rate)(l);
	loadFunc!(dJointGetPRAnchor)(l);
	loadFunc!(dJointGetPRPosition)(l);
	loadFunc!(dJointGetPRPositionRate)(l);
	loadFunc!(dJointGetPRAxis1)(l);
	loadFunc!(dJointGetPRAxis2)(l);
	loadFunc!(dJointGetPRParam)(l);
	loadFunc!(dJointGetAMotorNumAxes)(l);
	loadFunc!(dJointGetAMotorAxis)(l);
	loadFunc!(dJointGetAMotorAxisRel)(l);
	loadFunc!(dJointGetAMotorAngle)(l);
	loadFunc!(dJointGetAMotorAngleRate)(l);
	loadFunc!(dJointGetAMotorParam)(l);
	loadFunc!(dJointGetAMotorMode)(l);
	loadFunc!(dJointGetLMotorNumAxes)(l);
	loadFunc!(dJointGetLMotorAxis)(l);
	loadFunc!(dJointGetLMotorParam)(l);
//	loadFunc!(dJointGetFixedParam)(l);
	loadFunc!(dConnectingJoint)(l);
	loadFunc!(dConnectingJointList)(l);
	loadFunc!(dAreConnected)(l);
	loadFunc!(dAreConnectedExcluding)(l);
}

void loadODE_Space(Loader l)
{
	loadFunc!(dSimpleSpaceCreate)(l);
	loadFunc!(dHashSpaceCreate)(l);
	loadFunc!(dQuadTreeSpaceCreate)(l);
	loadFunc!(dSpaceDestroy)(l);
	loadFunc!(dHashSpaceSetLevels)(l);
	loadFunc!(dHashSpaceGetLevels)(l);
	loadFunc!(dSpaceSetCleanup)(l);
	loadFunc!(dSpaceGetCleanup)(l);
	loadFunc!(dSpaceAdd)(l);
	loadFunc!(dSpaceRemove)(l);
	loadFunc!(dSpaceQuery)(l);
	loadFunc!(dSpaceClean)(l);
	loadFunc!(dSpaceGetNumGeoms)(l);
	loadFunc!(dSpaceGetGeom)(l);
}

}