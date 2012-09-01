// This file is hand mangled of a ODE header file.
// See copyright in src/ode/ode.d (BSD).
module lib.ode.objects;

import lib.ode.common;
import lib.ode.mass;
import lib.ode.contact;


version(DynamicODE)
{
extern(C):
dWorldID function() dWorldCreate;
void function(dWorldID world) dWorldDestroy;
void function(dWorldID, dReal x, dReal y, dReal z) dWorldSetGravity;
void function(dWorldID, dVector3 gravity) dWorldGetGravity;
void function(dWorldID, dReal erp) dWorldSetERP;
dReal function(dWorldID) dWorldGetERP;
void function(dWorldID, dReal cfm) dWorldSetCFM;
dReal function(dWorldID) dWorldGetCFM;
void function(dWorldID, dReal stepsize) dWorldStep;
void function(dWorldID, dReal stepsize, dReal ix, dReal iy, dReal iz, dVector3 force) dWorldImpulseToForce;
void function(dWorldID w, dReal stepsize) dWorldQuickStep;
void function(dWorldID, int num) dWorldSetQuickStepNumIterations;
int function(dWorldID) dWorldGetQuickStepNumIterations;
void function(dWorldID, dReal over_relaxation) dWorldSetQuickStepW;
dReal function(dWorldID) dWorldGetQuickStepW;
void function(dWorldID, dReal vel) dWorldSetContactMaxCorrectingVel;
dReal function(dWorldID) dWorldGetContactMaxCorrectingVel;
void function(dWorldID, dReal depth) dWorldSetContactSurfaceLayer;
dReal function(dWorldID) dWorldGetContactSurfaceLayer;
void function(dWorldID, dReal stepsize, int maxiterations) dWorldStepFast1;
void function(dWorldID, int autoEnableDepth) dWorldSetAutoEnableDepthSF1;
int function(dWorldID) dWorldGetAutoEnableDepthSF1;
dReal function(dWorldID) dWorldGetAutoDisableLinearThreshold;
void function(dWorldID, dReal linear_threshold) dWorldSetAutoDisableLinearThreshold;
dReal function(dWorldID) dWorldGetAutoDisableAngularThreshold;
void function(dWorldID, dReal angular_threshold) dWorldSetAutoDisableAngularThreshold;
//dReal function(dWorldID) dWorldGetAutoDisableLinearAverageThreshold;
//void function(dWorldID, dReal linear_average_threshold) dWorldSetAutoDisableLinearAverageThreshold;
//dReal function(dWorldID) dWorldGetAutoDisableAngularAverageThreshold;
//void function(dWorldID, dReal angular_average_threshold) dWorldSetAutoDisableAngularAverageThreshold;
int function(dWorldID) dWorldGetAutoDisableAverageSamplesCount;
void function(dWorldID, uint average_samples_count ) dWorldSetAutoDisableAverageSamplesCount;
int function(dWorldID) dWorldGetAutoDisableSteps;
void function(dWorldID, int steps) dWorldSetAutoDisableSteps;
dReal function(dWorldID) dWorldGetAutoDisableTime;
void function(dWorldID, dReal time) dWorldSetAutoDisableTime;
int function(dWorldID) dWorldGetAutoDisableFlag;
void function(dWorldID, int do_auto_disable) dWorldSetAutoDisableFlag;
dReal function(dBodyID) dBodyGetAutoDisableLinearThreshold;
void function(dBodyID, dReal linear_average_threshold) dBodySetAutoDisableLinearThreshold;
dReal function(dBodyID) dBodyGetAutoDisableAngularThreshold;
void function(dBodyID, dReal angular_average_threshold) dBodySetAutoDisableAngularThreshold;
int function(dBodyID) dBodyGetAutoDisableAverageSamplesCount;
void function(dBodyID, uint average_samples_count) dBodySetAutoDisableAverageSamplesCount;
int function(dBodyID) dBodyGetAutoDisableSteps;
void function(dBodyID, int steps) dBodySetAutoDisableSteps;
dReal function(dBodyID) dBodyGetAutoDisableTime;
void function(dBodyID, dReal time) dBodySetAutoDisableTime;
int function(dBodyID) dBodyGetAutoDisableFlag;
void function(dBodyID, int do_auto_disable) dBodySetAutoDisableFlag;
void function(dBodyID) dBodySetAutoDisableDefaults;
dWorldID function(dBodyID) dBodyGetWorld;
dBodyID function(dWorldID) dBodyCreate;
void function(dBodyID) dBodyDestroy;
void function(dBodyID, void *data) dBodySetData;
void* function(dBodyID) dBodyGetData;
void function(dBodyID, dReal x, dReal y, dReal z) dBodySetPosition;
void function(dBodyID, dMatrix3 R) dBodySetRotation;
void function(dBodyID, dQuaternion q) dBodySetQuaternion;
void function(dBodyID, dReal x, dReal y, dReal z) dBodySetLinearVel;
void function(dBodyID, dReal x, dReal y, dReal z) dBodySetAngularVel;
dReal* function(dBodyID) dBodyGetPosition;
void function(dBodyID b, dVector3 pos) dBodyCopyPosition;
dReal* function(dBodyID) dBodyGetRotation;
void function(dBodyID, dMatrix3 R) dBodyCopyRotation;
dReal* function(dBodyID) dBodyGetQuaternion;
void function(dBodyID b, dQuaternion quat) dBodyCopyQuaternion;
dReal* function(dBodyID) dBodyGetLinearVel;
dReal* function(dBodyID) dBodyGetAngularVel;
void function(dBodyID, dMass *mass) dBodySetMass;
void function(dBodyID, dMass *mass) dBodyGetMass;
void function(dBodyID, dReal fx, dReal fy, dReal fz) dBodyAddForce;
void function(dBodyID, dReal fx, dReal fy, dReal fz) dBodyAddTorque;
void function(dBodyID, dReal fx, dReal fy, dReal fz) dBodyAddRelForce;
void function(dBodyID, dReal fx, dReal fy, dReal fz) dBodyAddRelTorque;
void function(dBodyID, dReal fx, dReal fy, dReal fz, dReal px, dReal py, dReal pz) dBodyAddForceAtPos;
void function(dBodyID, dReal fx, dReal fy, dReal fz, dReal px, dReal py, dReal pz) dBodyAddForceAtRelPos;
void function(dBodyID, dReal fx, dReal fy, dReal fz, dReal px, dReal py, dReal pz) dBodyAddRelForceAtPos;
void function(dBodyID, dReal fx, dReal fy, dReal fz, dReal px, dReal py, dReal pz) dBodyAddRelForceAtRelPos;
dReal* function(dBodyID) dBodyGetForce;
dReal* function(dBodyID) dBodyGetTorque;
void function(dBodyID b, dReal x, dReal y, dReal z) dBodySetForce;
void function(dBodyID b, dReal x, dReal y, dReal z) dBodySetTorque;
void function(dBodyID, dReal px, dReal py, dReal pz, dVector3 result) dBodyGetRelPointPos;
void function(dBodyID, dReal px, dReal py, dReal pz, dVector3 result) dBodyGetRelPointVel;
void function(dBodyID, dReal px, dReal py, dReal pz, dVector3 result) dBodyGetPointVel;
void function(dBodyID, dReal px, dReal py, dReal pz, dVector3 result) dBodyGetPosRelPoint;
void function(dBodyID, dReal px, dReal py, dReal pz, dVector3 result) dBodyVectorToWorld;
void function(dBodyID, dReal px, dReal py, dReal pz, dVector3 result) dBodyVectorFromWorld;
void function(dBodyID, int mode) dBodySetFiniteRotationMode;
void function(dBodyID, dReal x, dReal y, dReal z) dBodySetFiniteRotationAxis;
int function(dBodyID) dBodyGetFiniteRotationMode;
void function(dBodyID, dVector3 result) dBodyGetFiniteRotationAxis;
int function(dBodyID b) dBodyGetNumJoints;
dJointID function(dBodyID, int index) dBodyGetJoint;
void function(dBodyID) dBodyEnable;
void function(dBodyID) dBodyDisable;
int function(dBodyID) dBodyIsEnabled;
void function(dBodyID b, int mode) dBodySetGravityMode;
int function(dBodyID b) dBodyGetGravityMode;
dJointID function(dWorldID, dJointGroupID) dJointCreateBall;
dJointID function(dWorldID, dJointGroupID) dJointCreateHinge;
dJointID function(dWorldID, dJointGroupID) dJointCreateSlider;
dJointID function(dWorldID, dJointGroupID, dContact *) dJointCreateContact;
dJointID function(dWorldID, dJointGroupID) dJointCreateHinge2;
dJointID function(dWorldID, dJointGroupID) dJointCreateUniversal;
dJointID function(dWorldID, dJointGroupID) dJointCreatePR;
dJointID function(dWorldID, dJointGroupID) dJointCreateFixed;
dJointID function(dWorldID, dJointGroupID) dJointCreateNull;
dJointID function(dWorldID, dJointGroupID) dJointCreateAMotor;
dJointID function(dWorldID, dJointGroupID) dJointCreateLMotor;
dJointID function(dWorldID, dJointGroupID) dJointCreatePlane2D;
void function(dJointID) dJointDestroy;
dJointGroupID function(int max_size) dJointGroupCreate;
void function(dJointGroupID) dJointGroupDestroy;
void function(dJointGroupID) dJointGroupEmpty;
void function(dJointID, dBodyID body1, dBodyID body2) dJointAttach;
void function(dJointID, void *data) dJointSetData;
void* function(dJointID) dJointGetData;
int function(dJointID) dJointGetType;
dBodyID function(dJointID, int index) dJointGetBody;
void function(dJointID, dJointFeedback *) dJointSetFeedback;
dJointFeedback* function(dJointID) dJointGetFeedback;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetBallAnchor;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetBallAnchor2;
//void function(dJointID, int parameter, dReal value) dJointSetBallParam;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetHingeAnchor;
void function(dJointID, dReal x, dReal y, dReal z, dReal ax, dReal ay, dReal az) dJointSetHingeAnchorDelta;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetHingeAxis;
void function(dJointID, int parameter, dReal value) dJointSetHingeParam;
void function(dJointID joint, dReal torque) dJointAddHingeTorque;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetSliderAxis;
void function(dJointID, dReal x, dReal y, dReal z, dReal ax, dReal ay, dReal az) dJointSetSliderAxisDelta;
void function(dJointID, int parameter, dReal value) dJointSetSliderParam;
void function(dJointID joint, dReal force) dJointAddSliderForce;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetHinge2Anchor;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetHinge2Axis1;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetHinge2Axis2;
void function(dJointID, int parameter, dReal value) dJointSetHinge2Param;
void function(dJointID joint, dReal torque1, dReal torque2) dJointAddHinge2Torques;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetUniversalAnchor;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetUniversalAxis1;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetUniversalAxis2;
void function(dJointID, int parameter, dReal value) dJointSetUniversalParam;
void function(dJointID joint, dReal torque1, dReal torque2) dJointAddUniversalTorques;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetPRAnchor;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetPRAxis1;
void function(dJointID, dReal x, dReal y, dReal z) dJointSetPRAxis2;
void function(dJointID, int parameter, dReal value) dJointSetPRParam;
void function(dJointID j, dReal torque) dJointAddPRTorque;
void function(dJointID) dJointSetFixed;
//void function(dJointID, int parameter, dReal value) dJointSetFixedParam;
void function(dJointID, int num) dJointSetAMotorNumAxes;
void function(dJointID, int anum, int rel, dReal x, dReal y, dReal z) dJointSetAMotorAxis;
void function(dJointID, int anum, dReal angle) dJointSetAMotorAngle;
void function(dJointID, int parameter, dReal value) dJointSetAMotorParam;
void function(dJointID, int mode) dJointSetAMotorMode;
void function(dJointID, dReal torque1, dReal torque2, dReal torque3) dJointAddAMotorTorques;
void function(dJointID, int num) dJointSetLMotorNumAxes;
void function(dJointID, int anum, int rel, dReal x, dReal y, dReal z) dJointSetLMotorAxis;
void function(dJointID, int parameter, dReal value) dJointSetLMotorParam;
void function(dJointID, int parameter, dReal value) dJointSetPlane2DXParam;
void function(dJointID, int parameter, dReal value) dJointSetPlane2DYParam;
void function(dJointID, int parameter, dReal value) dJointSetPlane2DAngleParam;
void function(dJointID, dVector3 result) dJointGetBallAnchor;
void function(dJointID, dVector3 result) dJointGetBallAnchor2;
//dReal function(dJointID, int parameter) dJointGetBallParam;
void function(dJointID, dVector3 result) dJointGetHingeAnchor;
void function(dJointID, dVector3 result) dJointGetHingeAnchor2;
void function(dJointID, dVector3 result) dJointGetHingeAxis;
dReal function(dJointID, int parameter) dJointGetHingeParam;
dReal function(dJointID) dJointGetHingeAngle;
dReal function(dJointID) dJointGetHingeAngleRate;
dReal function(dJointID) dJointGetSliderPosition;
dReal function(dJointID) dJointGetSliderPositionRate;
void function(dJointID, dVector3 result) dJointGetSliderAxis;
dReal function(dJointID, int parameter) dJointGetSliderParam;
void function(dJointID, dVector3 result) dJointGetHinge2Anchor;
void function(dJointID, dVector3 result) dJointGetHinge2Anchor2;
void function(dJointID, dVector3 result) dJointGetHinge2Axis1;
void function(dJointID, dVector3 result) dJointGetHinge2Axis2;
dReal function(dJointID, int parameter) dJointGetHinge2Param;
dReal function(dJointID) dJointGetHinge2Angle1;
dReal function(dJointID) dJointGetHinge2Angle1Rate;
dReal function(dJointID) dJointGetHinge2Angle2Rate;
void function(dJointID, dVector3 result) dJointGetUniversalAnchor;
void function(dJointID, dVector3 result) dJointGetUniversalAnchor2;
void function(dJointID, dVector3 result) dJointGetUniversalAxis1;
void function(dJointID, dVector3 result) dJointGetUniversalAxis2;
dReal function(dJointID, int parameter) dJointGetUniversalParam;
void function(dJointID, dReal *angle1, dReal *angle2) dJointGetUniversalAngles;
dReal function(dJointID) dJointGetUniversalAngle1;
dReal function(dJointID) dJointGetUniversalAngle2;
dReal function(dJointID) dJointGetUniversalAngle1Rate;
dReal function(dJointID) dJointGetUniversalAngle2Rate;
void function(dJointID, dVector3 result) dJointGetPRAnchor;
dReal function(dJointID) dJointGetPRPosition;
dReal function(dJointID) dJointGetPRPositionRate;
void function(dJointID, dVector3 result) dJointGetPRAxis1;
void function(dJointID, dVector3 result) dJointGetPRAxis2;
dReal function(dJointID, int parameter) dJointGetPRParam;
int function(dJointID) dJointGetAMotorNumAxes;
void function(dJointID, int anum, dVector3 result) dJointGetAMotorAxis;
int function(dJointID, int anum) dJointGetAMotorAxisRel;
dReal function(dJointID, int anum) dJointGetAMotorAngle;
dReal function(dJointID, int anum) dJointGetAMotorAngleRate;
dReal function(dJointID, int parameter) dJointGetAMotorParam;
int function(dJointID) dJointGetAMotorMode;
int function(dJointID) dJointGetLMotorNumAxes;
void function(dJointID, int anum, dVector3 result) dJointGetLMotorAxis;
dReal function(dJointID, int parameter) dJointGetLMotorParam;
//dReal function(dJointID, int parameter) dJointGetFixedParam;
dJointID function(dBodyID, dBodyID) dConnectingJoint;
int function(dBodyID, dBodyID, dJointID*) dConnectingJointList;
int function(dBodyID, dBodyID) dAreConnected;
int function(dBodyID body1, dBodyID body2, int joint_type) dAreConnectedExcluding;
}
else
{
extern(C):
dWorldID dWorldCreate();
void dWorldDestroy(dWorldID world);
void dWorldSetGravity(dWorldID, dReal x, dReal y, dReal z);
void dWorldGetGravity(dWorldID, dVector3 gravity);
void dWorldSetERP(dWorldID, dReal erp);
dReal dWorldGetERP(dWorldID);
void dWorldSetCFM(dWorldID, dReal cfm);
dReal dWorldGetCFM(dWorldID);
void dWorldStep(dWorldID, dReal stepsize);
void dWorldImpulseToForce(dWorldID, dReal stepsize, dReal ix, dReal iy, dReal iz, dVector3 force);
void dWorldQuickStep(dWorldID w, dReal stepsize);
void dWorldSetQuickStepNumIterations(dWorldID, int num);
int dWorldGetQuickStepNumIterations(dWorldID);
void dWorldSetQuickStepW(dWorldID, dReal over_relaxation);
dReal dWorldGetQuickStepW(dWorldID);
void dWorldSetContactMaxCorrectingVel(dWorldID, dReal vel);
dReal dWorldGetContactMaxCorrectingVel(dWorldID);
void dWorldSetContactSurfaceLayer(dWorldID, dReal depth);
dReal dWorldGetContactSurfaceLayer(dWorldID);
void dWorldStepFast1(dWorldID, dReal stepsize, int maxiterations);
void dWorldSetAutoEnableDepthSF1(dWorldID, int autoEnableDepth);
int dWorldGetAutoEnableDepthSF1(dWorldID);
dReal dWorldGetAutoDisableLinearThreshold(dWorldID);
void dWorldSetAutoDisableLinearThreshold(dWorldID, dReal linear_threshold);
dReal dWorldGetAutoDisableAngularThreshold(dWorldID);
void dWorldSetAutoDisableAngularThreshold(dWorldID, dReal angular_threshold);
//dReal dWorldGetAutoDisableLinearAverageThreshold(dWorldID);
//void dWorldSetAutoDisableLinearAverageThreshold(dWorldID, dReal linear_average_threshold);
//dReal dWorldGetAutoDisableAngularAverageThreshold(dWorldID);
//void dWorldSetAutoDisableAngularAverageThreshold(dWorldID, dReal angular_average_threshold);
int dWorldGetAutoDisableAverageSamplesCount(dWorldID);
void dWorldSetAutoDisableAverageSamplesCount(dWorldID, uint average_samples_count );
int dWorldGetAutoDisableSteps(dWorldID);
void dWorldSetAutoDisableSteps(dWorldID, int steps);
dReal dWorldGetAutoDisableTime(dWorldID);
void dWorldSetAutoDisableTime(dWorldID, dReal time);
int dWorldGetAutoDisableFlag(dWorldID);
void dWorldSetAutoDisableFlag(dWorldID, int do_auto_disable);
dReal dBodyGetAutoDisableLinearThreshold(dBodyID);
void dBodySetAutoDisableLinearThreshold(dBodyID, dReal linear_average_threshold);
dReal dBodyGetAutoDisableAngularThreshold(dBodyID);
void dBodySetAutoDisableAngularThreshold(dBodyID, dReal angular_average_threshold);
int dBodyGetAutoDisableAverageSamplesCount(dBodyID);
void dBodySetAutoDisableAverageSamplesCount(dBodyID, uint average_samples_count);
int dBodyGetAutoDisableSteps(dBodyID);
void dBodySetAutoDisableSteps(dBodyID, int steps);
dReal dBodyGetAutoDisableTime(dBodyID);
void dBodySetAutoDisableTime(dBodyID, dReal time);
int dBodyGetAutoDisableFlag(dBodyID);
void dBodySetAutoDisableFlag(dBodyID, int do_auto_disable);
void dBodySetAutoDisableDefaults(dBodyID);
dWorldID dBodyGetWorld(dBodyID);
dBodyID dBodyCreate(dWorldID);
void dBodyDestroy(dBodyID);
void dBodySetData(dBodyID, void *data);
void* dBodyGetData(dBodyID);
void dBodySetPosition(dBodyID, dReal x, dReal y, dReal z);
void dBodySetRotation(dBodyID, dMatrix3 R);
void dBodySetQuaternion(dBodyID, dQuaternion q);
void dBodySetLinearVel(dBodyID, dReal x, dReal y, dReal z);
void dBodySetAngularVel(dBodyID, dReal x, dReal y, dReal z);
dReal* dBodyGetPosition(dBodyID);
void dBodyCopyPosition(dBodyID b, dVector3 pos);
dReal* dBodyGetRotation(dBodyID);
void dBodyCopyRotation(dBodyID, dMatrix3 R);
dReal* dBodyGetQuaternion(dBodyID);
void dBodyCopyQuaternion(dBodyID b, dQuaternion quat);
dReal* dBodyGetLinearVel(dBodyID);
dReal* dBodyGetAngularVel(dBodyID);
void dBodySetMass(dBodyID, dMass *mass);
void dBodyGetMass(dBodyID, dMass *mass);
void dBodyAddForce(dBodyID, dReal fx, dReal fy, dReal fz);
void dBodyAddTorque(dBodyID, dReal fx, dReal fy, dReal fz);
void dBodyAddRelForce(dBodyID, dReal fx, dReal fy, dReal fz);
void dBodyAddRelTorque(dBodyID, dReal fx, dReal fy, dReal fz);
void dBodyAddForceAtPos(dBodyID, dReal fx, dReal fy, dReal fz, dReal px, dReal py, dReal pz);
void dBodyAddForceAtRelPos(dBodyID, dReal fx, dReal fy, dReal fz, dReal px, dReal py, dReal pz);
void dBodyAddRelForceAtPos(dBodyID, dReal fx, dReal fy, dReal fz, dReal px, dReal py, dReal pz);
void dBodyAddRelForceAtRelPos(dBodyID, dReal fx, dReal fy, dReal fz, dReal px, dReal py, dReal pz);
dReal* dBodyGetForce(dBodyID);
dReal* dBodyGetTorque(dBodyID);
void dBodySetForce(dBodyID b, dReal x, dReal y, dReal z);
void dBodySetTorque(dBodyID b, dReal x, dReal y, dReal z);
void dBodyGetRelPointPos(dBodyID, dReal px, dReal py, dReal pz, dVector3 result);
void dBodyGetRelPointVel(dBodyID, dReal px, dReal py, dReal pz, dVector3 result);
void dBodyGetPointVel(dBodyID, dReal px, dReal py, dReal pz, dVector3 result);
void dBodyGetPosRelPoint(dBodyID, dReal px, dReal py, dReal pz, dVector3 result);
void dBodyVectorToWorld(dBodyID, dReal px, dReal py, dReal pz, dVector3 result);
void dBodyVectorFromWorld(dBodyID, dReal px, dReal py, dReal pz, dVector3 result);
void dBodySetFiniteRotationMode(dBodyID, int mode);
void dBodySetFiniteRotationAxis(dBodyID, dReal x, dReal y, dReal z);
int dBodyGetFiniteRotationMode(dBodyID);
void dBodyGetFiniteRotationAxis(dBodyID, dVector3 result);
int dBodyGetNumJoints(dBodyID b);
dJointID dBodyGetJoint(dBodyID, int index);
void dBodyEnable(dBodyID);
void dBodyDisable(dBodyID);
int dBodyIsEnabled(dBodyID);
void dBodySetGravityMode(dBodyID b, int mode);
int dBodyGetGravityMode(dBodyID b);
dJointID dJointCreateBall(dWorldID, dJointGroupID);
dJointID dJointCreateHinge(dWorldID, dJointGroupID);
dJointID dJointCreateSlider(dWorldID, dJointGroupID);
dJointID dJointCreateContact(dWorldID, dJointGroupID, dContact *);
dJointID dJointCreateHinge2(dWorldID, dJointGroupID);
dJointID dJointCreateUniversal(dWorldID, dJointGroupID);
dJointID dJointCreatePR(dWorldID, dJointGroupID);
dJointID dJointCreateFixed(dWorldID, dJointGroupID);
dJointID dJointCreateNull(dWorldID, dJointGroupID);
dJointID dJointCreateAMotor(dWorldID, dJointGroupID);
dJointID dJointCreateLMotor(dWorldID, dJointGroupID);
dJointID dJointCreatePlane2D(dWorldID, dJointGroupID);
void dJointDestroy(dJointID);
dJointGroupID dJointGroupCreate(int max_size);
void dJointGroupDestroy(dJointGroupID);
void dJointGroupEmpty(dJointGroupID);
void dJointAttach(dJointID, dBodyID body1, dBodyID body2);
void dJointSetData(dJointID, void *data);
void* dJointGetData(dJointID);
int dJointGetType(dJointID);
dBodyID dJointGetBody(dJointID, int index);
void dJointSetFeedback(dJointID, dJointFeedback *);
dJointFeedback* dJointGetFeedback(dJointID);
void dJointSetBallAnchor(dJointID, dReal x, dReal y, dReal z);
void dJointSetBallAnchor2(dJointID, dReal x, dReal y, dReal z);
//void dJointSetBallParam(dJointID, int parameter, dReal value);
void dJointSetHingeAnchor(dJointID, dReal x, dReal y, dReal z);
void dJointSetHingeAnchorDelta(dJointID, dReal x, dReal y, dReal z, dReal ax, dReal ay, dReal az);
void dJointSetHingeAxis(dJointID, dReal x, dReal y, dReal z);
void dJointSetHingeParam(dJointID, int parameter, dReal value);
void dJointAddHingeTorque(dJointID joint, dReal torque);
void dJointSetSliderAxis(dJointID, dReal x, dReal y, dReal z);
void dJointSetSliderAxisDelta(dJointID, dReal x, dReal y, dReal z, dReal ax, dReal ay, dReal az);
void dJointSetSliderParam(dJointID, int parameter, dReal value);
void dJointAddSliderForce(dJointID joint, dReal force);
void dJointSetHinge2Anchor(dJointID, dReal x, dReal y, dReal z);
void dJointSetHinge2Axis1(dJointID, dReal x, dReal y, dReal z);
void dJointSetHinge2Axis2(dJointID, dReal x, dReal y, dReal z);
void dJointSetHinge2Param(dJointID, int parameter, dReal value);
void dJointAddHinge2Torques(dJointID joint, dReal torque1, dReal torque2);
void dJointSetUniversalAnchor(dJointID, dReal x, dReal y, dReal z);
void dJointSetUniversalAxis1(dJointID, dReal x, dReal y, dReal z);
void dJointSetUniversalAxis2(dJointID, dReal x, dReal y, dReal z);
void dJointSetUniversalParam(dJointID, int parameter, dReal value);
void dJointAddUniversalTorques(dJointID joint, dReal torque1, dReal torque2);
void dJointSetPRAnchor(dJointID, dReal x, dReal y, dReal z);
void dJointSetPRAxis1(dJointID, dReal x, dReal y, dReal z);
void dJointSetPRAxis2(dJointID, dReal x, dReal y, dReal z);
void dJointSetPRParam(dJointID, int parameter, dReal value);
void dJointAddPRTorque(dJointID j, dReal torque);
void dJointSetFixed(dJointID);
//void dJointSetFixedParam(dJointID, int parameter, dReal value);
void dJointSetAMotorNumAxes(dJointID, int num);
void dJointSetAMotorAxis(dJointID, int anum, int rel, dReal x, dReal y, dReal z);
void dJointSetAMotorAngle(dJointID, int anum, dReal angle);
void dJointSetAMotorParam(dJointID, int parameter, dReal value);
void dJointSetAMotorMode(dJointID, int mode);
void dJointAddAMotorTorques(dJointID, dReal torque1, dReal torque2, dReal torque3);
void dJointSetLMotorNumAxes(dJointID, int num);
void dJointSetLMotorAxis(dJointID, int anum, int rel, dReal x, dReal y, dReal z);
void dJointSetLMotorParam(dJointID, int parameter, dReal value);
void dJointSetPlane2DXParam(dJointID, int parameter, dReal value);
void dJointSetPlane2DYParam(dJointID, int parameter, dReal value);
void dJointSetPlane2DAngleParam(dJointID, int parameter, dReal value);
void dJointGetBallAnchor(dJointID, dVector3 result);
void dJointGetBallAnchor2(dJointID, dVector3 result);
//dReal dJointGetBallParam(dJointID, int parameter);
void dJointGetHingeAnchor(dJointID, dVector3 result);
void dJointGetHingeAnchor2(dJointID, dVector3 result);
void dJointGetHingeAxis(dJointID, dVector3 result);
dReal dJointGetHingeParam(dJointID, int parameter);
dReal dJointGetHingeAngle(dJointID);
dReal dJointGetHingeAngleRate(dJointID);
dReal dJointGetSliderPosition(dJointID);
dReal dJointGetSliderPositionRate(dJointID);
void dJointGetSliderAxis(dJointID, dVector3 result);
dReal dJointGetSliderParam(dJointID, int parameter);
void dJointGetHinge2Anchor(dJointID, dVector3 result);
void dJointGetHinge2Anchor2(dJointID, dVector3 result);
void dJointGetHinge2Axis1(dJointID, dVector3 result);
void dJointGetHinge2Axis2(dJointID, dVector3 result);
dReal dJointGetHinge2Param(dJointID, int parameter);
dReal dJointGetHinge2Angle1(dJointID);
dReal dJointGetHinge2Angle1Rate(dJointID);
dReal dJointGetHinge2Angle2Rate(dJointID);
void dJointGetUniversalAnchor(dJointID, dVector3 result);
void dJointGetUniversalAnchor2(dJointID, dVector3 result);
void dJointGetUniversalAxis1(dJointID, dVector3 result);
void dJointGetUniversalAxis2(dJointID, dVector3 result);
dReal dJointGetUniversalParam(dJointID, int parameter);
void dJointGetUniversalAngles(dJointID, dReal *angle1, dReal *angle2);
dReal dJointGetUniversalAngle1(dJointID);
dReal dJointGetUniversalAngle2(dJointID);
dReal dJointGetUniversalAngle1Rate(dJointID);
dReal dJointGetUniversalAngle2Rate(dJointID);
void dJointGetPRAnchor(dJointID, dVector3 result);
dReal dJointGetPRPosition(dJointID);
dReal dJointGetPRPositionRate(dJointID);
void dJointGetPRAxis1(dJointID, dVector3 result);
void dJointGetPRAxis2(dJointID, dVector3 result);
dReal dJointGetPRParam(dJointID, int parameter);
int dJointGetAMotorNumAxes(dJointID);
void dJointGetAMotorAxis(dJointID, int anum, dVector3 result);
int dJointGetAMotorAxisRel(dJointID, int anum);
dReal dJointGetAMotorAngle(dJointID, int anum);
dReal dJointGetAMotorAngleRate(dJointID, int anum);
dReal dJointGetAMotorParam(dJointID, int parameter);
int dJointGetAMotorMode(dJointID);
int dJointGetLMotorNumAxes(dJointID);
void dJointGetLMotorAxis(dJointID, int anum, dVector3 result);
dReal dJointGetLMotorParam(dJointID, int parameter);
//dReal dJointGetFixedParam(dJointID, int parameter);
dJointID dConnectingJoint(dBodyID, dBodyID);
int dConnectingJointList(dBodyID, dBodyID, dJointID*);
int dAreConnected(dBodyID, dBodyID);
int dAreConnectedExcluding(dBodyID body1, dBodyID body2, int joint_type);
}
