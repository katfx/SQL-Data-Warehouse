<h1>Data Dictionary for Gold Layer</h1>

<h2>Overview</h2>

This Gold Layer is the business-level data representation to support analytical use case. It
consists of <b>dimension tables</b> and <b>fact tables</b> for specific business metrics.

<b>1. gold.dim_customer</b>
    <ul>
      <li>
        <b>Purpose</b>: Stores customer details enriched with demographic and geographic data
      </li>
      <li>
        <b>Columns</b>:</ul>
      </li>
      <table>
          <tr>
            <td>Column Name</td>
            <td>Data Type</td>
            <td>Description</td>
          </tr>
          <tr>
            <td>customer_key</td>
            <td>INT</td>
            <td>Surrogate key uniquely identifying each customer record in the dimension table.</td>
          </tr>
          <tr>
            <td>customer_id</td>
            <td>INT</td>
            <td>Unique numerical identifier assigned to each customer.</td>
          </tr>
          <tr>
            <td>customer_number</td>
            <td>NVARCHAR(50)</td>
            <td>Alphanumeric identifier representing the customer, used for tracking and referencing.</td>
          </tr>
          <tr>
            <td>first_name</td>
            <td>NVARCHAR(50)</td>
            <td>Customer's firstname as record in the system.</td>
          </tr>
          <tr>
            <td>last_name</td>
            <td>NVARCHAR(50)</td>
            <td>Customer's lastname or family name.</td>
          </tr>
          <tr>
            <td>country</td>
            <td>NVARCHAR(50)</td>
            <td>The country of residence for the customer (e.g 'United States').</td>
          </tr>
          <tr>
            <td>marital_status</td>
            <td>NVARCHAR(50)</td>
            <td>The marital status of the customer (e.g 'Single', 'Married').</td>
          </tr>
          <tr>
            <td>gender</td>
            <td>NVARCHAR(50)</td>
            <td>The gender of the customer (e.g 'Male', 'Female', 'n/a').</td>
          </tr>
          <tr>
            <td>birthdate</td>
            <td>DATE</td>
            <td>The date of birth of the customer, formatted as YYY-MM-DD (e.g 1971-10-06).</td>
          </tr>
          <tr>
            <td>create_date</td>
            <td>DATE</td>
            <td>The date and time when the customer record was captured in the system.</td>
          </tr>
      </table>
    </ul>

<b>2. gold.dim_product</b>
    <ul>
      <li>
        <b>Purpose</b>: Provides information about the products and their attributes
      </li>
      <li>
        <b>Columns</b>:</ul>
      </li>
      <table>
          <tr>
            <td>Column Name</td>
            <td>Data Type</td>
            <td>Description</td>
          </tr>
          <tr>
            <td>product_key</td>
            <td>INT</td>
            <td>Surrogate key uniquely identifying each product record in the dimension table.</td>
          </tr>
          <tr>
            <td>product_id</td>
            <td>INT</td>
            <td>A unique identifier assigned to the product for internal tracking and referencing.</td>
          </tr>
          <tr>
            <td>product_number</td>
            <td>NVARCHAR(50)</td>
            <td>A structured alphanumeric code representing the product often used for categorizatiion or inventory.</td>
          </tr>
          <tr>
            <td>product_name</td>
            <td>NVARCHAR(50)</td>
            <td>Descriptive name of the product, including key details such as type, color, size.</td>
          </tr>
          <tr>
            <td>category_id</td>
            <td>NVARCHAR(50)</td>
            <td>A unique identifier for the product category, linking to its high-level calssification.</td>
          </tr>
          <tr>
            <td>category</td>
            <td>NVARCHAR(50)</td>
            <td>The broader classification of the product (e.g Bikes, Components) to group related items.</td>
          </tr>
          <tr>
            <td>subcategory</td>
            <td>NVARCHAR(50)</td>
            <td>A more detailed classification of the orduct within the category, such as product type.</td>
          </tr>
          <tr>
            <td>maintenace</td>
            <td>NVARCHAR(50)</td>
            <td>Indicates wheter the product requires maintenance(e.g 'Yes', 'No').</td>
          </tr>
          <tr>
            <td>cost</td>
            <td>INT</td>
            <td>The cost or base price of the product measured in monetary units.</td>
          </tr>
          <tr>
            <td>product_line</td>
            <td>NVARCHAR(50)</td>
            <td>The specific product line or series to which the product belongs (e.g Road, Mountain).</td>
          </tr>
           <tr>
            <td>start_line</td>
            <td>DATE</td>
            <td>The date when the product became available for sale or use, stored in.</td>
          </tr>
      </table>
    </ul>

<b>3. gold.fact_sales</b>
    <ul>
      <li>
        <b>Purpose</b>: Stores transactional sales data for analytical purposes
      </li>
      <li>
        <b>Columns</b>:</ul>
      </li>
      <table>
          <tr>
            <td>Column Name</td>
            <td>Data Type</td>
            <td>Description</td>
          </tr>
          <tr>
            <td>order_number</td>
            <td>NVARCHAR(50)</td>
            <td>A unique alphanumeric identifier for each sales order (e.g 'SO54496').</td>
          </tr>
          <tr>
            <td>product_key</td>
            <td>INT</td>
            <td>Surrogate key linking the order to the product dimension table.</td>
          </tr>
          <tr>
            <td>customer_key</td>
            <td>INT</td>
            <td>Surrogate key linking the order to the customer dimension table.</td>
          </tr>
          <tr>
            <td>order_date</td>
            <td>DATE</td>
            <td>The date when the order was placed.</td>
          </tr>
          <tr>
            <td>shipping_date</td>
            <td>DATE</td>
            <td>The date when the order was sipped to the customer.</td>
          </tr>
          <tr>
            <td>due_date</td>
            <td>DATE</td>
            <td>The date when the order was due.</td>
          </tr>
          <tr>
            <td>sales_amount</td>
            <td>INT</td>
            <td>The total monetary value of the sales for the line item, in whole currency (e.g 25).</td>
          </tr>
          <tr>
            <td>quantity</td>
            <td>INT</td>
            <td>The number of units of the product ordered for the item (e.g 1).</td>
          </tr>
          <tr>
            <td>price</td>
            <td>INT</td>
            <td>The price per unit of the product for the line item, in whole currency units (e.g 25).</td>
          </tr>
      </table>
    </ul>











































    
