package com.pie.util;

public class StateCode {

	public static String getStateCode(String state) {
//		Andhra Pradesh	37	AD
//		Arunachal Pradesh	12	AR
//		Assam	18	AS
//		Bihar	10	BR
//		Chattisgarh	22	CG
//		Delhi	7	DL
//		Goa	30	GA
//		Gujarat	24	GJ
//		Haryana	6	HR
//		Himachal Pradesh	2	HP
//		Jammu and Kashmir	1	JK
//		Jharkhand	20	JH
//		Karnataka	29	KA
//		Kerala	32	KL
//		Lakshadweep Islands	31	LD
//		Madhya Pradesh	23	MP
//		Maharashtra	27	MH
//		Manipur	14	MN
//		Meghalaya	17	ML
//		Mizoram	15	MZ
//		Nagaland	13	NL
//		Odisha	21	OD
//		Pondicherry	34	PY
//		Punjab	3	PB
//		Rajasthan	8	RJ
//		Sikkim	11	SK
//		Tamil Nadu	33	TN
//		Telangana	36	TS
//		Tripura	16	TR
//		Uttar Pradesh	9	UP
//		Uttarakhand	5	UK
//		West Bengal	19	WB
//		Andaman and Nicobar Islands	35	AN
//		Chandigarh	4	CH
//		Dadra & Nagar Haveli and Daman & Diu	26	DNHDD
//		Ladakh	38	LA
//		Other Territory	97	OT
		if(state == null) {
			return "97";
		}

		switch (state.toLowerCase()) {
		case "andhra":
		case "ad":
		case "andhra pradesh": {
			return "37";
		}
		case "ar":
		case "arunachal pradesh": {
			return "12";
		}
		case "asam":
		case "as":
		case "assam": {
			return "18";
		}
		case "br":
		case "bihaar":
		case "bihar": {
			return "10";
		}
		case "cg":
		case "chatisgarh":
		case "chhattisgarh":
		case "chateesgarh":
		case "chattisgarh": {
			return "22";
		}
		case "dl":
		case "dilli":
		case "new delhi":
		case "nd":
		case "delhi": {
			return "07";
		}
		case "ga":
		case "goa": {
			return "30";
		}
		case "gj":
		case "gujrat":
		case "gujraat":
		case "gujarat": {
			return "24";
		}
		case "hr":
		case "har":
		case "haryan":
		case "haryana": {
			return "06";
		}
		case "hp":
		case "himachalpradesh":
		case "himachal prades":
		case "himachal pradesh": {
			return "02";
		}
		case "jk":
		case "j&k":
		case "jnk":
		case "jammu kashmir":
		case "jammu kasmir":
		case "jammu and kashmir": {
			return "01";
		}
		case "jh":
		case "jharkand":
		case "jharkhand": {
			return "20";
		}
		case "ka":
		case "karnatak":
		case "karnataka": {
			return "29";
		}
		case "kl":
		case "keral":
		case "kerala": {
			return "32";
		}
		case "ld":
		case "lakshadweepislands":
		case "lakshadweep":
		case "lakshadweep islands": {
			return "31";
		}
		case "mp":
		case "madhya prades":
		case "madhyaprades":
		case "madhyapradesh":
		case "madhya pradesh": {
			return "23";
		}
		case "mh":
		case "maharashtr":
		case "maha":
		case "maharashtra": {
			return "27";
		}
		case "mn":
		case "manipur": {
			return "14";
		}
		case "ml":
		case "meghalay":
		case "megalay":
		case "megalaya":
		case "meghalaya": {
			return "17";
		}
		case "mz":
		case "mijoram":
		case "mizoram": {
			return "15";
		}
		case "nl":
		case "nagland":
		case "nagaland": {
			return "13";
		}
		case "od":
		case "odisa":
		case "orrisa":
		case "orrisha":
		case "orisa":
		case "orisha":
		case "odisha": {
			return "21";
		}
		case "py":
		case "puducherry":
		case "pondichery":
		case "pondicheri":
		case "pondicherry": {
			return "34";
		}
		case "pb":
		case "pun":
		case "panjab":
		case "punjab": {
			return "03";
		}
		case "rj":
		case "rajastan":
		case "raj":
		case "rajasthan": {
			return "08";
		}
		case "sk":
		case "sikim":
		case "sikkimm":
		case "sikimm":
		case "sikkim": {
			return "11";
		}
		case "tn":
		case "tamilnadu":
		case "tamilnaddu":
		case "tamil nadu": {
			return "33";
		}
		case "ts":
		case "telangana": {
			return "36";
		}
		case "tr":
		case "tripura": {
			return "16";
		}
		case "up":
		case "uttarpradesh":
		case "uttar prades":
		case "utar pradesh":
		case "uttar pradesh": {
			return "09";
		}
		case "uk":
		case "utarakhand":
		case "uttrakhand":
		case "uttarakhand": {
			return "05";
		}
		case "wb":
		case "westbengal":
		case "west bengal": {
			return "19";
		}
		case "an":
		case "andaman and nicobar":
		case "andamanandnicobar":
		case "andaman":
		case "andaman islands":
		case "andaman and nicobar islands": {
			return "35";
		}
		case "ch":
		case "chandigar":
		case "chandigarh": {
			return "04";
		}
		case "dnhdd":
		case "dadar and nagar haveli & daman and diu":
		case "dadra and nagar haveli and daman and diu":
		case "dadra & nagar haveli":
		case "dadra and nagar haveli":
		case "daman & diu":
		case "daman and diu":
		case "dadra & nagar haveli and daman & diu": {
			return "26";
		}
		case "la":
		case "ladak":
		case "ladakh": {
			return "38";
		}
		case "ot" :
		case "other" :
		case "other territory": {
			return "97";
		}
		default : {
			return "97";
		}

		}
	}
}
