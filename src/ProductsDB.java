
public class ProductsDB {

	private String model;
	private String type;
	private int torque;
	private int cc;
	private int price;
	private String desc;
	private int count;
	private String base64Image;
	
//	public ProductsDB(String model, String type, int torque, int cc, int price, String desc, int count, String base64Image) {
//		super();
//		this.model = model;
//		this.type = type;
//		this.torque = torque;
//		this.cc = cc;
//		this.price = price;
//		this.desc = desc;
//		this.count = count;
//		this.base64Image = base64Image;
//	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getTorque() {
		return torque;
	}

	public void setTorque(int torque) {
		this.torque = torque;
	}

	public int getCc() {
		return cc;
	}

	public void setCc(int cc) {
		this.cc = cc;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getBase64Image() {
		return base64Image;
	}

	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	
}
