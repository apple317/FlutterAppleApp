package io.flutter.plugins.systemstatus;

import android.os.Environment;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

/**
 * <p>文件描述：<p>
 * <p>作者：apple_hsp<p>
 * <p>创建时间：2019/1/8<p>
 * <p>更改时间：2019/1/8<p>
 * <p>版本号：1<p>
 */

public class BuildProperties {
  private final Properties properties;

  private BuildProperties() throws IOException {
    properties = new Properties();
    properties.load(new FileInputStream(new File(Environment.getRootDirectory(), "build.prop")));
  }

  public boolean containsKey(final Object key) {
    return properties.containsKey(key);
  }

  public boolean containsValue(final Object value) {
    return properties.containsValue(value);
  }

  public Set<Map.Entry<Object, Object>> entrySet() {
    return properties.entrySet();
  }

  public String getProperty(final String name) {
    return properties.getProperty(name);
  }

  public String getProperty(final String name, final String defaultValue) {
    return properties.getProperty(name, defaultValue);
  }

  public boolean isEmpty() {
    return properties.isEmpty();
  }

  public Enumeration<Object> keys() {
    return properties.keys();
  }

  public Set<Object> keySet() {
    return properties.keySet();
  }

  public int size() {
    return properties.size();
  }

  public Collection<Object> values() {
    return properties.values();
  }

  public static BuildProperties newInstance() throws IOException {
    return new BuildProperties();
  }


}
