Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1AE18C31;
	Wed, 29 Jan 2025 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738164228; cv=none; b=gbb+JYYG3tSaFnb6nXj8Q8spvIfcv6SIxtuk9ibpxUWMtpKRQc4nE0hmXzlMxRCDhjBH2CSEjq+cXCjCn3SyWpZwwSFmwYhzlPDQYVyYJ2UUCXMicZselI9e55rnwrhPtWjNvFbddnI5bHFEjmuWkFTLej/npjEZE7vrZvhs4gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738164228; c=relaxed/simple;
	bh=+rTwhscsC809b4h70ecnpAoF7PVbAFBNwWOrqiJe6z4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qe8DoHvicbgl6ANQQMruLh+voguv/+Ll2s7tXwKaDW/AHIlNMavObspfdz1G6QCFVRdqiWxMm4s4Gjl+hBZp2lw/RaN1aamKqbhiZtEUBx58oSxbRx5U7RuGsdvbOjIRvLhFtkEyW2Ic21SR48jrdwEv2WsbimRfEcfjBkFs0bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1td9uD-000000007jW-04vi;
	Wed, 29 Jan 2025 10:23:05 -0500
Message-ID: <b804115c4df4a9283118329e06656c1c76b69b5c.camel@surriel.com>
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
From: Rik van Riel <riel@surriel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Peter Zijlstra <peterz@infradead.org>, David Hildenbrand
 <david@redhat.com>,  kernel test robot <oliver.sang@intel.com>,
 oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, Andrew
 Morton <akpm@linux-foundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski	 <luto@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, David Rientjes	 <rientjes@google.com>,
 Hugh Dickins <hughd@google.com>, Jann Horn	 <jannh@google.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>,
 Mel Gorman <mgorman@suse.de>, Muchun Song <muchun.song@linux.dev>,  Peter
 Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>, Zach O'Keefe
 <zokeefe@google.com>,  Dan Carpenter <dan.carpenter@linaro.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, Frederic Weisbecker	 <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Date: Wed, 29 Jan 2025 10:23:04 -0500
In-Reply-To: <14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
References: <202501281734.d408a35b-lkp@intel.com>
	 <46ea4509-0f38-4b22-bd91-f05c68db2562@redhat.com>
	 <20250128113100.GB7145@noisy.programming.kicks-ass.net>
	 <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
	 <20250128132847.GB505@noisy.programming.kicks-ass.net>
	 <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
	 <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
	 <2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
	 <14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Sender: riel@surriel.com

T24gV2VkLCAyMDI1LTAxLTI5IGF0IDE2OjE0ICswODAwLCBRaSBaaGVuZyB3cm90ZToKPiBPbiAy
MDI1LzEvMjkgMDI6MzUsIFJpayB2YW4gUmllbCB3cm90ZToKPiA+IAo+ID4gVGhhdCBsb29rcyBs
aWtlIHRoZSBSQ1UgZnJlZWluZyBzb21laG93IGJ5cGFzc2luZyB0aGUKPiA+IHBlci1jcHUtcGFn
ZXMsIGFuZCBoaXR0aW5nIHRoZSB6b25lLT5sb2NrIGF0IHBhZ2UgZnJlZQo+ID4gdGltZSwgd2hp
bGUgcmVndWxhciBmcmVlaW5nIHVzdWFsbHkgcHV0cyBwYWdlcyBpbiB0aGUKPiA+IENQVS1sb2Nh
bCBmcmVlIHBhZ2UgY2FjaGUsIHdpdGhvdXQgdGhlIGxvY2s/Cj4gCj4gVGFrZSB0aGUgZm9sbG93
aW5nIGNhbGwgc3RhY2sgYXMgYW4gZXhhbXBsZToKPiAKPiBAWwo+IF9yYXdfc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSs1Cj4gZnJlZV9vbmVfcGFnZSs4NQo+IHRsYl9yZW1vdmVfdGFibGVfcmN1KzE0
MAo+IHJjdV9kb19iYXRjaCs0MjQKPiByY3VfY29yZSs0MDEKPiBoYW5kbGVfc29mdGlycXMrMjA0
Cj4gaXJxX2V4aXRfcmN1KzIwOAo+IHN5c3ZlY19hcGljX3RpbWVyX2ludGVycnVwdCsxMTMKPiBh
c21fc3lzdmVjX2FwaWNfdGltZXJfaW50ZXJydXB0KzI2Cj4gX3Jhd19zcGluX3VubG9ja19pcnFy
ZXN0b3JlKzI5Cj4gZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdCsyMDE0Cj4gX19hbGxvY19mcm96ZW5f
cGFnZXNfbm9wcm9mKzM2NAo+IGFsbG9jX3BhZ2VzX21wb2wrMTIzCj4gYWxsb2NfcGFnZXNfbm9w
cm9mKzE0Cj4gZ2V0X2ZyZWVfcGFnZXNfbm9wcm9mKzE3Cj4gX194NjRfc3lzX21pbmNvcmUrMTQx
Cj4gZG9fc3lzY2FsbF82NCs5OAo+IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsxMTgK
PiAsIHN0cmVzcy1uZy1tbWFwYV06IDUzMDEKPiAKPiBJdCBsb29rcyBsaWtlIHRoZSBmb2xsb3dp
bmcgaGFwcGVuZWQ6Cj4gCj4gZ2V0X3BhZ2VfZnJvbV9mcmVlbGlzdAo+IC0tPiBybXF1ZXVlCj4g
wqDCoMKgwqAgLS0+IHJtcXVldWVfcGNwbGlzdAo+IMKgwqDCoMKgwqDCoMKgwqAgLS0+IHBjcF9z
cGluX3RyeWxvY2sgKGhvbGQgdGhlIHBjcCBsb2NrKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBfX3JtcXVldWVfcGNwbGlzdAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtLT4gcm1xdWV1
ZV9idWxrCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLS0+IHNwaW5fbG9ja19p
cnFzYXZlKCZ6b25lLT5sb2NrKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgX19ybXF1ZXVlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ6b25lLT5sb2NrKQo+IAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPHJ1biBzb2Z0aXJxIGF0IHRoaXMgdGltZT4KPiAK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRsYl9yZW1vdmVfdGFi
bGVfcmN1Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtLT4gZnJl
ZV9mcm96ZW5fcGFnZXMKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLS0+IHBjcCA9IHBjcF9zcGluX3RyeWxvY2sgKGZhaWxlZCEhISkKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXBj
cCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGZyZWVfb25lX3BhZ2UKPiAKPiBJdCBzZWVtcyB0aGF0IHRoZSBwY3AgbG9j
ayBpcyBoZWxkIHdoZW4gZG9pbmcgdGxiX3JlbW92ZV90YWJsZV9yY3UoKSwKPiBzbwo+IHRyeWxv
Y2sgZmFpbHMsIHRoZW4gYnlwYXNzaW5nIFBDUCBhbmQgY2FsbGluZyBmcmVlX29uZV9wYWdlKCkK
PiBkaXJlY3RseSwKPiB3aGljaCBsZWFkcyB0byB0aGUgaG90IHNwb3Qgb2Ygem9uZSBsb2NrLgo+
IAo+IEFzIGZvciB0aGUgcmVndWxhciBmcmVlaW5nLCBzaW5jZSB0aGUgZnJlZWluZyBvcGVyYXRp
b24gd2lsbCBub3QgYmUKPiBwZXJmb3JtZWQgaW4gdGhlIHNvZnRpcnEsIHRoZSBhYm92ZSBzaXR1
YXRpb24gd2lsbCBub3Qgb2NjdXIuCj4gCj4gUmlnaHQ/CgpZb3UgYXJlIGFic29sdXRlbHkgcmln
aHQhCgpUaGlzIHJhaXNlcyBhbiBpbnRlcmVzdGluZyBxdWVzdGlvbjogc2hvdWxkIHdlIGtlZXAK
UkNVIGZyb20gcnVubmluZyBjYWxsYmFja3Mgd2hpbGUgdGhlIHBjcF9zcGlubG9jayBpcwpoZWxk
LCBhbmQgd2hhdCB3b3VsZCBiZSB0aGUgYmVzdCB3YXkgdG8gZG8gdGhhdD8KCkFyZSB0aGVyZSBv
dGhlciBjb3JuZXIgY2FzZXMgd2hlcmUgUkNVIGNhbGxiYWNrcwpzaG91bGQgbm90IGJlIHJ1bm5p
bmcgZnJvbSBzb2Z0aXJxIGNvbnRleHQgYXQKaXJxIHJlZW5hYmxlIHRpbWU/CgpTaG91bGQgbWF5
YmUgdGhlIFJDVSBjYWxsYmFja3Mgb25seSBydW4gd2hlbgp0aGUgY3VycmVudCBwcm9jZXNzIGhh
cyBubyBsb2NrcyBoZWxkLApvciBzaG91bGQgdGhleSBzaW1wbHkgYWx3YXlzIHJ1biBmcm9tIHNv
bWUKa2VybmVsIHRocmVhZD8KCkknbSByZWFsbHkgbm90IHN1cmUgd2hhdCB0aGUgcmlnaHQgYW5z
d2VyIGlzLi4uCgotLSAKQWxsIFJpZ2h0cyBSZXZlcnNlZC4K

