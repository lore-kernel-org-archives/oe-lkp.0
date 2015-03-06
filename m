Content-Type: multipart/mixed; boundary="===============7726405191623036805=="
MIME-Version: 1.0
From: Murali Karicheri <m-karicheri2@ti.com>
To: lkp@lists.01.org
Subject: Re: [PCI] BUG: unable to handle kernel
Date: Fri, 06 Mar 2015 12:58:00 -0500
Message-ID: <54F9EAA8.30007@ti.com>
In-Reply-To: <20150306165504.GA30094@roeck-us.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7726405191623036805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/06/2015 11:55 AM, Guenter Roeck wrote:
> On Fri, Mar 06, 2015 at 10:48:59AM -0500, Murali Karicheri wrote:
> [ ... ]
>
>> > From 098b4f5e4ab9407fbdbfcca3a91785c17e25cf03 Mon Sep 17 00:00:00 2001
>> From: Murali Karicheri<m-karicheri2@ti.com>
>> Date: Fri, 6 Mar 2015 10:23:08 -0500
>> Subject: [PATCH] pci: of : fix kernel crash
>>
>> This is a debug patch to root cause the kernel crash
>>
>> 	commit 0b2af171520e5d5e7d5b5f479b90a6a5014d9df6
>>
>> 	PCI: Update DMA configuration from DT
>>
>> Signed-off-by: Murali Karicheri<m-karicheri2@ti.com>
>> ---
>>   drivers/of/of_pci.c       |    8 ++++++++
>>   drivers/pci/host-bridge.c |    5 +++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
>> index 86d3c38..5a59fb8 100644
>> --- a/drivers/of/of_pci.c
>> +++ b/drivers/of/of_pci.c
>> @@ -129,6 +129,14 @@ void of_pci_dma_configure(struct pci_dev *pci_dev)
>>   	struct device *dev =3D&pci_dev->dev;
>>   	struct device *bridge =3D pci_get_host_bridge_device(pci_dev);
>>
>> +	if (!bridge || !bridge->parent) {
>> +		if (!bridge)
>> +			pr_err("PCI bridge not found\n");
>> +		if (!bridge->parent)
>> +			pr_err("PCI bridge parent not found\n");
>
> You'll see a crash here if bridge is NULL. Maybe add an else before the s=
econd
> if statement ? Also, dev_err might be a bit more useful and would be avai=
lable.
>
Fixed and attached.

Murali
> Thanks,
> Guenter
>
>> +		return;
>> +	}
>> +
>>   	of_dma_configure(dev, bridge->parent->of_node);
>>   	pci_put_host_bridge_device(bridge);
>>   }
>> diff --git a/drivers/pci/host-bridge.c b/drivers/pci/host-bridge.c
>> index 3e5bbf9..ef2ab51 100644
>> --- a/drivers/pci/host-bridge.c
>> +++ b/drivers/pci/host-bridge.c
>> @@ -28,6 +28,11 @@ struct device *pci_get_host_bridge_device(struct pci_=
dev *dev)
>>   	struct pci_bus *root_bus =3D find_pci_root_bus(dev->bus);
>>   	struct device *bridge =3D root_bus->bridge;
>>
>> +	if (!bridge) {
>> +		pr_err("PCI: bridge not found\n");
>> +		return NULL;
>> +	}
>> +
>>   	kobject_get(&bridge->kobj);
>>   	return bridge;
>>   }
>> --
>> 1.7.9.5
>>
>


-- =

Murali Karicheri
Linux Kernel, Texas Instruments

--===============7726405191623036805==
Content-Type: text/x-diff
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-pci-of-fix-kernel-crash.patch"

PkZyb20gNDk2NWE0NTgwZTBmZmUxM2U3ZTZlOWZkNThkNmU1NmIwOGM3MzBjNCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogTXVyYWxpIEthcmljaGVyaSA8bS1rYXJpY2hlcmkyQHRpLmNv
bT4KRGF0ZTogRnJpLCA2IE1hciAyMDE1IDEwOjIzOjA4IC0wNTAwClN1YmplY3Q6IFtQQVRDSF0g
cGNpOiBvZiA6IGZpeCBrZXJuZWwgY3Jhc2gKClRoaXMgaXMgYSBkZWJ1ZyBwYXRjaCB0byByb290
IGNhdXNlIHRoZSBrZXJuZWwgY3Jhc2gKCgljb21taXQgMGIyYWYxNzE1MjBlNWQ1ZTdkNWI1ZjQ3
OWI5MGE2YTUwMTRkOWRmNgoKCVBDSTogVXBkYXRlIERNQSBjb25maWd1cmF0aW9uIGZyb20gRFQK
ClNpZ25lZC1vZmYtYnk6IE11cmFsaSBLYXJpY2hlcmkgPG0ta2FyaWNoZXJpMkB0aS5jb20+Ci0t
LQogZHJpdmVycy9vZi9vZl9wY2kuYyAgICAgICB8ICAgIDkgKysrKysrKysrCiBkcml2ZXJzL3Bj
aS9ob3N0LWJyaWRnZS5jIHwgICAgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9vZl9wY2kuYyBiL2RyaXZlcnMvb2Yvb2Zf
cGNpLmMKaW5kZXggODZkM2MzOC4uNmUxYjExMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9vZi9vZl9w
Y2kuYworKysgYi9kcml2ZXJzL29mL29mX3BjaS5jCkBAIC0xMjksNiArMTI5LDE1IEBAIHZvaWQg
b2ZfcGNpX2RtYV9jb25maWd1cmUoc3RydWN0IHBjaV9kZXYgKnBjaV9kZXYpCiAJc3RydWN0IGRl
dmljZSAqZGV2ID0gJnBjaV9kZXYtPmRldjsKIAlzdHJ1Y3QgZGV2aWNlICpicmlkZ2UgPSBwY2lf
Z2V0X2hvc3RfYnJpZGdlX2RldmljZShwY2lfZGV2KTsKIAorCWlmICghYnJpZGdlIHx8ICFicmlk
Z2UtPnBhcmVudCkgeworCQlpZiAoIWJyaWRnZSkKKwkJCWRldl9lcnIoJnBjaV9kZXYtPmRldiwg
IlBDSSBicmlkZ2Ugbm90IGZvdW5kXG4iKTsKKwkJZWxzZSBpZiAoIWJyaWRnZS0+cGFyZW50KQor
CQkJZGV2X2VycigmcGNpX2Rldi0+ZGV2LAorCQkJCSJQQ0kgYnJpZGdlIHBhcmVudCBub3QgZm91
bmRcbiIpOworCQlyZXR1cm47CisJfQorCiAJb2ZfZG1hX2NvbmZpZ3VyZShkZXYsIGJyaWRnZS0+
cGFyZW50LT5vZl9ub2RlKTsKIAlwY2lfcHV0X2hvc3RfYnJpZGdlX2RldmljZShicmlkZ2UpOwog
fQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvaG9zdC1icmlkZ2UuYyBiL2RyaXZlcnMvcGNpL2hv
c3QtYnJpZGdlLmMKaW5kZXggM2U1YmJmOS4uYmE2NDJiOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
Y2kvaG9zdC1icmlkZ2UuYworKysgYi9kcml2ZXJzL3BjaS9ob3N0LWJyaWRnZS5jCkBAIC0yOCw2
ICsyOCwxMSBAQCBzdHJ1Y3QgZGV2aWNlICpwY2lfZ2V0X2hvc3RfYnJpZGdlX2RldmljZShzdHJ1
Y3QgcGNpX2RldiAqZGV2KQogCXN0cnVjdCBwY2lfYnVzICpyb290X2J1cyA9IGZpbmRfcGNpX3Jv
b3RfYnVzKGRldi0+YnVzKTsKIAlzdHJ1Y3QgZGV2aWNlICpicmlkZ2UgPSByb290X2J1cy0+YnJp
ZGdlOwogCisJaWYgKCFicmlkZ2UpIHsKKwkJZGV2X2VycigmZGV2LT5kZXYsICJQQ0k6IGJyaWRn
ZSBub3QgZm91bmRcbiIpOworCQlyZXR1cm4gTlVMTDsKKwl9CisKIAlrb2JqZWN0X2dldCgmYnJp
ZGdlLT5rb2JqKTsKIAlyZXR1cm4gYnJpZGdlOwogfQotLSAKMS43LjkuNQoK

--===============7726405191623036805==--

