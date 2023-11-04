/*
 * Ory APIs
 * Documentation for all public and administrative Ory APIs. Administrative APIs can only be accessed with a valid Personal Access Token. Public APIs are mostly used in browsers. 
 *
 * The version of the OpenAPI document: v1.2.16
 * Contact: support@ory.sh
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


package sh.ory.model;

import java.util.Objects;
import com.google.gson.TypeAdapter;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.annotations.SerializedName;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.time.OffsetDateTime;
import java.util.Arrays;
import org.openapitools.jackson.nullable.JsonNullable;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.reflect.TypeToken;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;

import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import sh.ory.JSON;

/**
 * Subscription
 */
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.JavaClientCodegen", date = "2023-11-03T11:59:00.380339039Z[Etc/UTC]")
public class Subscription {
  public static final String SERIALIZED_NAME_CREATED_AT = "created_at";
  @SerializedName(SERIALIZED_NAME_CREATED_AT)
  private OffsetDateTime createdAt;

  /**
   * The currency of the subscription. To change this, a new subscription must be created. usd USD eur Euro
   */
  @JsonAdapter(CurrencyEnum.Adapter.class)
  public enum CurrencyEnum {
    USD("usd"),
    
    EUR("eur");

    private String value;

    CurrencyEnum(String value) {
      this.value = value;
    }

    public String getValue() {
      return value;
    }

    @Override
    public String toString() {
      return String.valueOf(value);
    }

    public static CurrencyEnum fromValue(String value) {
      for (CurrencyEnum b : CurrencyEnum.values()) {
        if (b.value.equals(value)) {
          return b;
        }
      }
      throw new IllegalArgumentException("Unexpected value '" + value + "'");
    }

    public static class Adapter extends TypeAdapter<CurrencyEnum> {
      @Override
      public void write(final JsonWriter jsonWriter, final CurrencyEnum enumeration) throws IOException {
        jsonWriter.value(enumeration.getValue());
      }

      @Override
      public CurrencyEnum read(final JsonReader jsonReader) throws IOException {
        String value =  jsonReader.nextString();
        return CurrencyEnum.fromValue(value);
      }
    }
  }

  public static final String SERIALIZED_NAME_CURRENCY = "currency";
  @SerializedName(SERIALIZED_NAME_CURRENCY)
  private CurrencyEnum currency;

  /**
   * The currently active interval of the subscription monthly Monthly yearly Yearly
   */
  @JsonAdapter(CurrentIntervalEnum.Adapter.class)
  public enum CurrentIntervalEnum {
    MONTHLY("monthly"),
    
    YEARLY("yearly");

    private String value;

    CurrentIntervalEnum(String value) {
      this.value = value;
    }

    public String getValue() {
      return value;
    }

    @Override
    public String toString() {
      return String.valueOf(value);
    }

    public static CurrentIntervalEnum fromValue(String value) {
      for (CurrentIntervalEnum b : CurrentIntervalEnum.values()) {
        if (b.value.equals(value)) {
          return b;
        }
      }
      throw new IllegalArgumentException("Unexpected value '" + value + "'");
    }

    public static class Adapter extends TypeAdapter<CurrentIntervalEnum> {
      @Override
      public void write(final JsonWriter jsonWriter, final CurrentIntervalEnum enumeration) throws IOException {
        jsonWriter.value(enumeration.getValue());
      }

      @Override
      public CurrentIntervalEnum read(final JsonReader jsonReader) throws IOException {
        String value =  jsonReader.nextString();
        return CurrentIntervalEnum.fromValue(value);
      }
    }
  }

  public static final String SERIALIZED_NAME_CURRENT_INTERVAL = "current_interval";
  @SerializedName(SERIALIZED_NAME_CURRENT_INTERVAL)
  private CurrentIntervalEnum currentInterval;

  public static final String SERIALIZED_NAME_CURRENT_PLAN = "current_plan";
  @SerializedName(SERIALIZED_NAME_CURRENT_PLAN)
  private String currentPlan;

  public static final String SERIALIZED_NAME_CUSTOMER_ID = "customer_id";
  @SerializedName(SERIALIZED_NAME_CUSTOMER_ID)
  private String customerId;

  public static final String SERIALIZED_NAME_ID = "id";
  @SerializedName(SERIALIZED_NAME_ID)
  private String id;

  public static final String SERIALIZED_NAME_INTERVAL_CHANGES_TO = "interval_changes_to";
  @SerializedName(SERIALIZED_NAME_INTERVAL_CHANGES_TO)
  private String intervalChangesTo;

  public static final String SERIALIZED_NAME_ONGOING_STRIPE_CHECKOUT_ID = "ongoing_stripe_checkout_id";
  @SerializedName(SERIALIZED_NAME_ONGOING_STRIPE_CHECKOUT_ID)
  private String ongoingStripeCheckoutId;

  public static final String SERIALIZED_NAME_PAYED_UNTIL = "payed_until";
  @SerializedName(SERIALIZED_NAME_PAYED_UNTIL)
  private OffsetDateTime payedUntil;

  public static final String SERIALIZED_NAME_PLAN_CHANGES_AT = "plan_changes_at";
  @SerializedName(SERIALIZED_NAME_PLAN_CHANGES_AT)
  private OffsetDateTime planChangesAt;

  public static final String SERIALIZED_NAME_PLAN_CHANGES_TO = "plan_changes_to";
  @SerializedName(SERIALIZED_NAME_PLAN_CHANGES_TO)
  private String planChangesTo;

  public static final String SERIALIZED_NAME_STATUS = "status";
  @SerializedName(SERIALIZED_NAME_STATUS)
  private String status;

  public static final String SERIALIZED_NAME_UPDATED_AT = "updated_at";
  @SerializedName(SERIALIZED_NAME_UPDATED_AT)
  private OffsetDateTime updatedAt;

  public Subscription() {
  }

  
  public Subscription(
     OffsetDateTime createdAt, 
     CurrencyEnum currency, 
     CurrentIntervalEnum currentInterval, 
     String currentPlan, 
     String customerId, 
     String id, 
     OffsetDateTime payedUntil, 
     OffsetDateTime updatedAt
  ) {
    this();
    this.createdAt = createdAt;
    this.currency = currency;
    this.currentInterval = currentInterval;
    this.currentPlan = currentPlan;
    this.customerId = customerId;
    this.id = id;
    this.payedUntil = payedUntil;
    this.updatedAt = updatedAt;
  }

   /**
   * Get createdAt
   * @return createdAt
  **/
  @javax.annotation.Nonnull
  public OffsetDateTime getCreatedAt() {
    return createdAt;
  }




   /**
   * The currency of the subscription. To change this, a new subscription must be created. usd USD eur Euro
   * @return currency
  **/
  @javax.annotation.Nonnull
  public CurrencyEnum getCurrency() {
    return currency;
  }




   /**
   * The currently active interval of the subscription monthly Monthly yearly Yearly
   * @return currentInterval
  **/
  @javax.annotation.Nonnull
  public CurrentIntervalEnum getCurrentInterval() {
    return currentInterval;
  }




   /**
   * The currently active plan of the subscription
   * @return currentPlan
  **/
  @javax.annotation.Nonnull
  public String getCurrentPlan() {
    return currentPlan;
  }




   /**
   * The ID of the stripe customer
   * @return customerId
  **/
  @javax.annotation.Nonnull
  public String getCustomerId() {
    return customerId;
  }




   /**
   * The ID of the subscription
   * @return id
  **/
  @javax.annotation.Nonnull
  public String getId() {
    return id;
  }




  public Subscription intervalChangesTo(String intervalChangesTo) {
    
    this.intervalChangesTo = intervalChangesTo;
    return this;
  }

   /**
   * Get intervalChangesTo
   * @return intervalChangesTo
  **/
  @javax.annotation.Nullable
  public String getIntervalChangesTo() {
    return intervalChangesTo;
  }


  public void setIntervalChangesTo(String intervalChangesTo) {
    this.intervalChangesTo = intervalChangesTo;
  }


  public Subscription ongoingStripeCheckoutId(String ongoingStripeCheckoutId) {
    
    this.ongoingStripeCheckoutId = ongoingStripeCheckoutId;
    return this;
  }

   /**
   * Get ongoingStripeCheckoutId
   * @return ongoingStripeCheckoutId
  **/
  @javax.annotation.Nullable
  public String getOngoingStripeCheckoutId() {
    return ongoingStripeCheckoutId;
  }


  public void setOngoingStripeCheckoutId(String ongoingStripeCheckoutId) {
    this.ongoingStripeCheckoutId = ongoingStripeCheckoutId;
  }


   /**
   * Until when the subscription is payed
   * @return payedUntil
  **/
  @javax.annotation.Nonnull
  public OffsetDateTime getPayedUntil() {
    return payedUntil;
  }




  public Subscription planChangesAt(OffsetDateTime planChangesAt) {
    
    this.planChangesAt = planChangesAt;
    return this;
  }

   /**
   * Get planChangesAt
   * @return planChangesAt
  **/
  @javax.annotation.Nullable
  public OffsetDateTime getPlanChangesAt() {
    return planChangesAt;
  }


  public void setPlanChangesAt(OffsetDateTime planChangesAt) {
    this.planChangesAt = planChangesAt;
  }


  public Subscription planChangesTo(String planChangesTo) {
    
    this.planChangesTo = planChangesTo;
    return this;
  }

   /**
   * Get planChangesTo
   * @return planChangesTo
  **/
  @javax.annotation.Nullable
  public String getPlanChangesTo() {
    return planChangesTo;
  }


  public void setPlanChangesTo(String planChangesTo) {
    this.planChangesTo = planChangesTo;
  }


  public Subscription status(String status) {
    
    this.status = status;
    return this;
  }

   /**
   * For &#x60;collection_method&#x3D;charge_automatically&#x60; a subscription moves into &#x60;incomplete&#x60; if the initial payment attempt fails. A subscription in this state can only have metadata and default_source updated. Once the first invoice is paid, the subscription moves into an &#x60;active&#x60; state. If the first invoice is not paid within 23 hours, the subscription transitions to &#x60;incomplete_expired&#x60;. This is a terminal state, the open invoice will be voided and no further invoices will be generated.  A subscription that is currently in a trial period is &#x60;trialing&#x60; and moves to &#x60;active&#x60; when the trial period is over.  If subscription &#x60;collection_method&#x3D;charge_automatically&#x60; it becomes &#x60;past_due&#x60; when payment to renew it fails and &#x60;canceled&#x60; or &#x60;unpaid&#x60; (depending on your subscriptions settings) when Stripe has exhausted all payment retry attempts.  If subscription &#x60;collection_method&#x3D;send_invoice&#x60; it becomes &#x60;past_due&#x60; when its invoice is not paid by the due date, and &#x60;canceled&#x60; or &#x60;unpaid&#x60; if it is still not paid by an additional deadline after that. Note that when a subscription has a status of &#x60;unpaid&#x60;, no subsequent invoices will be attempted (invoices will be created, but then immediately automatically closed). After receiving updated payment information from a customer, you may choose to reopen and pay their closed invoices.
   * @return status
  **/
  @javax.annotation.Nonnull
  public String getStatus() {
    return status;
  }


  public void setStatus(String status) {
    this.status = status;
  }


   /**
   * Get updatedAt
   * @return updatedAt
  **/
  @javax.annotation.Nonnull
  public OffsetDateTime getUpdatedAt() {
    return updatedAt;
  }



  /**
   * A container for additional, undeclared properties.
   * This is a holder for any undeclared properties as specified with
   * the 'additionalProperties' keyword in the OAS document.
   */
  private Map<String, Object> additionalProperties;

  /**
   * Set the additional (undeclared) property with the specified name and value.
   * If the property does not already exist, create it otherwise replace it.
   *
   * @param key name of the property
   * @param value value of the property
   * @return the Subscription instance itself
   */
  public Subscription putAdditionalProperty(String key, Object value) {
    if (this.additionalProperties == null) {
        this.additionalProperties = new HashMap<String, Object>();
    }
    this.additionalProperties.put(key, value);
    return this;
  }

  /**
   * Return the additional (undeclared) property.
   *
   * @return a map of objects
   */
  public Map<String, Object> getAdditionalProperties() {
    return additionalProperties;
  }

  /**
   * Return the additional (undeclared) property with the specified name.
   *
   * @param key name of the property
   * @return an object
   */
  public Object getAdditionalProperty(String key) {
    if (this.additionalProperties == null) {
        return null;
    }
    return this.additionalProperties.get(key);
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Subscription subscription = (Subscription) o;
    return Objects.equals(this.createdAt, subscription.createdAt) &&
        Objects.equals(this.currency, subscription.currency) &&
        Objects.equals(this.currentInterval, subscription.currentInterval) &&
        Objects.equals(this.currentPlan, subscription.currentPlan) &&
        Objects.equals(this.customerId, subscription.customerId) &&
        Objects.equals(this.id, subscription.id) &&
        Objects.equals(this.intervalChangesTo, subscription.intervalChangesTo) &&
        Objects.equals(this.ongoingStripeCheckoutId, subscription.ongoingStripeCheckoutId) &&
        Objects.equals(this.payedUntil, subscription.payedUntil) &&
        Objects.equals(this.planChangesAt, subscription.planChangesAt) &&
        Objects.equals(this.planChangesTo, subscription.planChangesTo) &&
        Objects.equals(this.status, subscription.status) &&
        Objects.equals(this.updatedAt, subscription.updatedAt)&&
        Objects.equals(this.additionalProperties, subscription.additionalProperties);
  }

  private static <T> boolean equalsNullable(JsonNullable<T> a, JsonNullable<T> b) {
    return a == b || (a != null && b != null && a.isPresent() && b.isPresent() && Objects.deepEquals(a.get(), b.get()));
  }

  @Override
  public int hashCode() {
    return Objects.hash(createdAt, currency, currentInterval, currentPlan, customerId, id, intervalChangesTo, ongoingStripeCheckoutId, payedUntil, planChangesAt, planChangesTo, status, updatedAt, additionalProperties);
  }

  private static <T> int hashCodeNullable(JsonNullable<T> a) {
    if (a == null) {
      return 1;
    }
    return a.isPresent() ? Arrays.deepHashCode(new Object[]{a.get()}) : 31;
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Subscription {\n");
    sb.append("    createdAt: ").append(toIndentedString(createdAt)).append("\n");
    sb.append("    currency: ").append(toIndentedString(currency)).append("\n");
    sb.append("    currentInterval: ").append(toIndentedString(currentInterval)).append("\n");
    sb.append("    currentPlan: ").append(toIndentedString(currentPlan)).append("\n");
    sb.append("    customerId: ").append(toIndentedString(customerId)).append("\n");
    sb.append("    id: ").append(toIndentedString(id)).append("\n");
    sb.append("    intervalChangesTo: ").append(toIndentedString(intervalChangesTo)).append("\n");
    sb.append("    ongoingStripeCheckoutId: ").append(toIndentedString(ongoingStripeCheckoutId)).append("\n");
    sb.append("    payedUntil: ").append(toIndentedString(payedUntil)).append("\n");
    sb.append("    planChangesAt: ").append(toIndentedString(planChangesAt)).append("\n");
    sb.append("    planChangesTo: ").append(toIndentedString(planChangesTo)).append("\n");
    sb.append("    status: ").append(toIndentedString(status)).append("\n");
    sb.append("    updatedAt: ").append(toIndentedString(updatedAt)).append("\n");
    sb.append("    additionalProperties: ").append(toIndentedString(additionalProperties)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }


  public static HashSet<String> openapiFields;
  public static HashSet<String> openapiRequiredFields;

  static {
    // a set of all properties/fields (JSON key names)
    openapiFields = new HashSet<String>();
    openapiFields.add("created_at");
    openapiFields.add("currency");
    openapiFields.add("current_interval");
    openapiFields.add("current_plan");
    openapiFields.add("customer_id");
    openapiFields.add("id");
    openapiFields.add("interval_changes_to");
    openapiFields.add("ongoing_stripe_checkout_id");
    openapiFields.add("payed_until");
    openapiFields.add("plan_changes_at");
    openapiFields.add("plan_changes_to");
    openapiFields.add("status");
    openapiFields.add("updated_at");

    // a set of required properties/fields (JSON key names)
    openapiRequiredFields = new HashSet<String>();
    openapiRequiredFields.add("created_at");
    openapiRequiredFields.add("currency");
    openapiRequiredFields.add("current_interval");
    openapiRequiredFields.add("current_plan");
    openapiRequiredFields.add("customer_id");
    openapiRequiredFields.add("id");
    openapiRequiredFields.add("interval_changes_to");
    openapiRequiredFields.add("payed_until");
    openapiRequiredFields.add("plan_changes_to");
    openapiRequiredFields.add("status");
    openapiRequiredFields.add("updated_at");
  }

 /**
  * Validates the JSON Element and throws an exception if issues found
  *
  * @param jsonElement JSON Element
  * @throws IOException if the JSON Element is invalid with respect to Subscription
  */
  public static void validateJsonElement(JsonElement jsonElement) throws IOException {
      if (jsonElement == null) {
        if (!Subscription.openapiRequiredFields.isEmpty()) { // has required fields but JSON element is null
          throw new IllegalArgumentException(String.format("The required field(s) %s in Subscription is not found in the empty JSON string", Subscription.openapiRequiredFields.toString()));
        }
      }

      // check to make sure all required properties/fields are present in the JSON string
      for (String requiredField : Subscription.openapiRequiredFields) {
        if (jsonElement.getAsJsonObject().get(requiredField) == null) {
          throw new IllegalArgumentException(String.format("The required field `%s` is not found in the JSON string: %s", requiredField, jsonElement.toString()));
        }
      }
        JsonObject jsonObj = jsonElement.getAsJsonObject();
      if (!jsonObj.get("currency").isJsonPrimitive()) {
        throw new IllegalArgumentException(String.format("Expected the field `currency` to be a primitive type in the JSON string but got `%s`", jsonObj.get("currency").toString()));
      }
      if (!jsonObj.get("current_interval").isJsonPrimitive()) {
        throw new IllegalArgumentException(String.format("Expected the field `current_interval` to be a primitive type in the JSON string but got `%s`", jsonObj.get("current_interval").toString()));
      }
      if (!jsonObj.get("current_plan").isJsonPrimitive()) {
        throw new IllegalArgumentException(String.format("Expected the field `current_plan` to be a primitive type in the JSON string but got `%s`", jsonObj.get("current_plan").toString()));
      }
      if (!jsonObj.get("customer_id").isJsonPrimitive()) {
        throw new IllegalArgumentException(String.format("Expected the field `customer_id` to be a primitive type in the JSON string but got `%s`", jsonObj.get("customer_id").toString()));
      }
      if (!jsonObj.get("id").isJsonPrimitive()) {
        throw new IllegalArgumentException(String.format("Expected the field `id` to be a primitive type in the JSON string but got `%s`", jsonObj.get("id").toString()));
      }
      if ((jsonObj.get("interval_changes_to") != null && !jsonObj.get("interval_changes_to").isJsonNull()) && !jsonObj.get("interval_changes_to").isJsonPrimitive()) {
        throw new IllegalArgumentException(String.format("Expected the field `interval_changes_to` to be a primitive type in the JSON string but got `%s`", jsonObj.get("interval_changes_to").toString()));
      }
      if ((jsonObj.get("ongoing_stripe_checkout_id") != null && !jsonObj.get("ongoing_stripe_checkout_id").isJsonNull()) && !jsonObj.get("ongoing_stripe_checkout_id").isJsonPrimitive()) {
        throw new IllegalArgumentException(String.format("Expected the field `ongoing_stripe_checkout_id` to be a primitive type in the JSON string but got `%s`", jsonObj.get("ongoing_stripe_checkout_id").toString()));
      }
      if ((jsonObj.get("plan_changes_to") != null && !jsonObj.get("plan_changes_to").isJsonNull()) && !jsonObj.get("plan_changes_to").isJsonPrimitive()) {
        throw new IllegalArgumentException(String.format("Expected the field `plan_changes_to` to be a primitive type in the JSON string but got `%s`", jsonObj.get("plan_changes_to").toString()));
      }
      if (!jsonObj.get("status").isJsonPrimitive()) {
        throw new IllegalArgumentException(String.format("Expected the field `status` to be a primitive type in the JSON string but got `%s`", jsonObj.get("status").toString()));
      }
  }

  public static class CustomTypeAdapterFactory implements TypeAdapterFactory {
    @SuppressWarnings("unchecked")
    @Override
    public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> type) {
       if (!Subscription.class.isAssignableFrom(type.getRawType())) {
         return null; // this class only serializes 'Subscription' and its subtypes
       }
       final TypeAdapter<JsonElement> elementAdapter = gson.getAdapter(JsonElement.class);
       final TypeAdapter<Subscription> thisAdapter
                        = gson.getDelegateAdapter(this, TypeToken.get(Subscription.class));

       return (TypeAdapter<T>) new TypeAdapter<Subscription>() {
           @Override
           public void write(JsonWriter out, Subscription value) throws IOException {
             JsonObject obj = thisAdapter.toJsonTree(value).getAsJsonObject();
             obj.remove("additionalProperties");
             // serialize additional properties
             if (value.getAdditionalProperties() != null) {
               for (Map.Entry<String, Object> entry : value.getAdditionalProperties().entrySet()) {
                 if (entry.getValue() instanceof String)
                   obj.addProperty(entry.getKey(), (String) entry.getValue());
                 else if (entry.getValue() instanceof Number)
                   obj.addProperty(entry.getKey(), (Number) entry.getValue());
                 else if (entry.getValue() instanceof Boolean)
                   obj.addProperty(entry.getKey(), (Boolean) entry.getValue());
                 else if (entry.getValue() instanceof Character)
                   obj.addProperty(entry.getKey(), (Character) entry.getValue());
                 else {
                   obj.add(entry.getKey(), gson.toJsonTree(entry.getValue()).getAsJsonObject());
                 }
               }
             }
             elementAdapter.write(out, obj);
           }

           @Override
           public Subscription read(JsonReader in) throws IOException {
             JsonElement jsonElement = elementAdapter.read(in);
             validateJsonElement(jsonElement);
             JsonObject jsonObj = jsonElement.getAsJsonObject();
             // store additional fields in the deserialized instance
             Subscription instance = thisAdapter.fromJsonTree(jsonObj);
             for (Map.Entry<String, JsonElement> entry : jsonObj.entrySet()) {
               if (!openapiFields.contains(entry.getKey())) {
                 if (entry.getValue().isJsonPrimitive()) { // primitive type
                   if (entry.getValue().getAsJsonPrimitive().isString())
                     instance.putAdditionalProperty(entry.getKey(), entry.getValue().getAsString());
                   else if (entry.getValue().getAsJsonPrimitive().isNumber())
                     instance.putAdditionalProperty(entry.getKey(), entry.getValue().getAsNumber());
                   else if (entry.getValue().getAsJsonPrimitive().isBoolean())
                     instance.putAdditionalProperty(entry.getKey(), entry.getValue().getAsBoolean());
                   else
                     throw new IllegalArgumentException(String.format("The field `%s` has unknown primitive type. Value: %s", entry.getKey(), entry.getValue().toString()));
                 } else if (entry.getValue().isJsonArray()) {
                     instance.putAdditionalProperty(entry.getKey(), gson.fromJson(entry.getValue(), List.class));
                 } else { // JSON object
                     instance.putAdditionalProperty(entry.getKey(), gson.fromJson(entry.getValue(), HashMap.class));
                 }
               }
             }
             return instance;
           }

       }.nullSafe();
    }
  }

 /**
  * Create an instance of Subscription given an JSON string
  *
  * @param jsonString JSON string
  * @return An instance of Subscription
  * @throws IOException if the JSON string is invalid with respect to Subscription
  */
  public static Subscription fromJson(String jsonString) throws IOException {
    return JSON.getGson().fromJson(jsonString, Subscription.class);
  }

 /**
  * Convert an instance of Subscription to an JSON string
  *
  * @return JSON string
  */
  public String toJson() {
    return JSON.getGson().toJson(this);
  }
}
