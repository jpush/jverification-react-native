import { 
    DeviceEventEmitter, 
    NativeModules,
    Platform
   } from 'react-native'

   const JVerificationModule = NativeModules.JVerificationModule

   export default class JVerification {
    static initPush () {
        JVerificationModule.setup()
    }
    

   }