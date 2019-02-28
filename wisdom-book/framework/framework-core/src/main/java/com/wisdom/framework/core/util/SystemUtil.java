package com.wisdom.framework.core.util;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Properties;

public class SystemUtil {

    public static String getIpAddress() throws UnknownHostException {

        InetAddress address = InetAddress.getLocalHost();
        return address.getHostAddress();
    }

    public static String getSystemName() throws UnknownHostException {
        Properties props=System.getProperties();
        String osName = props.getProperty("os.name");
        return osName;
    }

}
