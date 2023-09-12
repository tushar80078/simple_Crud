const sessionService = require("../services/sessions.service");
const authHelper = require("../helper/functions/authHelper");
const dateTimeGenerator = require("../helper/functions/timeDateGenerator");


// --------------------------------- Create Recorded Session -----------------------------------------


exports.postCreateRecordedSession=async(req,res,next)=>{
    try 
    {        
        const recordedSessionData = req.body;

        /*
        model video_recorded_sessions {
  id               Int       @id @default(autoincrement())
  session_name     Int
  recording_date   DateTime  @db.DateTime(0)
  video_url        String?   @db.Text
  base_points      Decimal   @db.Decimal(10, 2)
  allocated_points Decimal   @db.Decimal(10, 2)
  isMandatory      Boolean
  publish          Boolean
}   */

        if(!recordedSessionData.session_name || !recordedSessionData.publish.toString() || !recordedSessionData.base_points || !recordedSessionData.allocated_points || !recordedSessionData.isMandatory.toString())
        {
            return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - session_name,publish, base_points, allocated_points, isMandatory)` });
        }

        const isSessionExists = await sessionService.getRecordedSessionByName(recordedSessionData.session_name);

        if(isSessionExists)
        {
            return next({ statusCode: 409, message: `Session already exists with name`}); 
        }

        //------- Generate current time to add in database
        const created_at = dateTimeGenerator.generateCurrentTiimeDate();     

        const createSessionResponse = await sessionService.createRecordedSession({created_at,...recordedSessionData});

        if(createSessionResponse)
        {
            return res.status(200).send({
                msg : "RecordedSession Created Successfully!!",
                sessionResponse :  createSessionResponse
            }) 
        }else{
            return next(`Error While Creating Session`);
        }

        
    } catch (error) {
        return next(error);
    }   

}



// --------------------------------- Create Live Session -----------------------------------------


exports.postCreateLiveSession=async(req,res,next)=>{
    try 
    {        
        const liveSessionData = req.body;

        /*
        
model live_sessions {
  id               Int       @id @default(autoincrement())
  session_name     String    @db.VarChar(255)
  session_duration Int
  base_points      Decimal  @db.Decimal(10, 2)
  allocated_points Decimal  @db.Decimal(10, 2)
  isMandatory      Boolean
  created_at       DateTime? @db.Timestamp(0)
  updated_at       DateTime? @default(now()) @db.Timestamp(0)
  publish          Boolean
}  */

        if(!liveSessionData.session_name || !liveSessionData.session_duration || !liveSessionData.publish.toString() || !liveSessionData.base_points || !liveSessionData.allocated_points || !liveSessionData.isMandatory.toString())
        {
            return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - session_name,session_duration,publish, base_points, allocated_points, isMandatory)` });
        }

        const isSessionExists = await sessionService.getLiveSessionsByName(liveSessionData.session_name);

        if(isSessionExists)
        {
            return next({ statusCode: 409, message: `Session already exists with name`}); 
        }

        //------- Generate current time to add in database
        const created_at = dateTimeGenerator.generateCurrentTiimeDate();     

        const createSessionResponse = await sessionService.createLiveSession({created_at,...liveSessionData});

        if(createSessionResponse)
        {
            return res.status(200).send({
                msg : "LiveSession Created Successfully!!",
                sessionResponse :  createSessionResponse
            }) 
        }else{
            return next(`Error While Creating Session`);
        }

        
    } catch (error) {
        return next(error);
    }   

}
