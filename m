Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD9D221DA1
	for <oe-lkp@lists.linux.dev>; Tue, 11 Mar 2025 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741678056; cv=none; b=TKVzmo0mAJJpRktERm+/MAIMSr3feb3kbgy1ezlmCbpdt/ml1eo1uQeu4ypmV95sK2UoUgyaiEpLi0m2IiMl8k8SDfInvaECeXsQXSyIyjfae8M85y92lE+fWACjYe4opANgudg/eGUPNTov8ikt8Qsd7gIvFlRlyM7I2mDCPzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741678056; c=relaxed/simple;
	bh=stQIiUNLuqEHjJoODJyAMhHAOo0USnx04Q2RzLCuPu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OeGdY9uaGkCgvFE4G0IZkLizf2RlcIAJqasycyO2aimo/ox3lr5ROSgP5kcuGcPNnoYlJWcxUIsPyqmiZj6zT30vXgYVO3zugLeE+iR0SmcFpP4eJ2FRpN4JMBZCFaVy5ScjSnAIk39SingAqrv9UACupsyrc/muaaEOjcA9El4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 43cfda32fe4a11efa216b1d71e6e1362-20250311
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:3dc87d35-bfe1-4761-a9de-ec26d9451ec1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:9bd491b5f3e91c0733a7b8ff98a6724a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 43cfda32fe4a11efa216b1d71e6e1362-20250311
Received: from node2.com.cn [(10.44.16.197)] by mailgw.kylinos.cn
	(envelope-from <liuye@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1192882239; Tue, 11 Mar 2025 15:27:19 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
	by node2.com.cn (NSMail) with SMTP id D4C66B804E8F;
	Tue, 11 Mar 2025 15:27:18 +0800 (CST)
X-ns-mid: postfix-67CFE5D6-8161111199
Received: from [172.30.70.73] (unknown [172.30.70.73])
	by node2.com.cn (NSMail) with ESMTPA id BCC3DB80758A;
	Tue, 11 Mar 2025 07:27:15 +0000 (UTC)
Message-ID: <e563f63c-a37f-4405-921f-6da6c9709788@kylinos.cn>
Date: Tue, 11 Mar 2025 15:26:59 +0800
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] [mm/vmalloc] ff6f2b81ea:
 WARNING:at_kernel/fork.c:#vm_area_init_from
To: Uladzislau Rezki <urezki@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Christop Hellwig <hch@infradead.org>, linux-mm@kvack.org
References: <202503101629.7289b1-lkp@intel.com> <Z88Y4KcvjcskC5TW@pc636>
Content-Language: en-US
From: liuye <liuye@kylinos.cn>
In-Reply-To: <Z88Y4KcvjcskC5TW@pc636>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A8 2025/3/11 00:52, Uladzislau Rezki =E5=86=99=E9=81=93:
> Hello, Andrew, Liu Ye.
>=20
>>
>> Hello,
>>
>> kernel test robot noticed "WARNING:at_kernel/fork.c:#vm_area_init_from=
" on:
>>
>> commit: ff6f2b81eaa8a9fe5d158c6e7b1e58d3929c32c1 ("mm/vmalloc: move fr=
ee_vm_area(area) from the __vmalloc_area_node function to the __vmalloc_n=
ode_range_noprof function")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git maste=
r
>>
>> [test failed on linux-next/master 0a2f889128969dab41861b6e40111aa03dc5=
7014]
>>
>> in testcase: trinity
>> version:=20
>> with following parameters:
>>
>> 	runtime: 300s
>> 	group: group-02
>> 	nr_groups: 5
>>
>>
>>
>> config: x86_64-randconfig-101-20250306
>> compiler: gcc-12
>> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
>>
>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>
>>
>> +-------------------------------------------------------------+-------=
-----+------------+
>> |                                                             | fb8faf=
4337 | ff6f2b81ea |
>> +-------------------------------------------------------------+-------=
-----+------------+
>> | boot_successes                                              | 9     =
     | 0          |
>> | boot_failures                                               | 0     =
     | 6          |
>> | WARNING:at_kernel/fork.c:#vm_area_init_from                 | 0     =
     | 6          |
>> | RIP:vm_area_init_from                                       | 0     =
     | 6          |
>> | BUG:KASAN:slab-use-after-free_in__vmalloc_node_range_noprof | 0     =
     | 5          |
>> | WARNING:at_mm/vmalloc.c:#remove_vm_area                     | 0     =
     | 5          |
>> | RIP:remove_vm_area                                          | 0     =
     | 5          |
>> | kernel_BUG_at_mm/vmalloc.c                                  | 0     =
     | 5          |
>> | Oops:invalid_opcode:#[##]PREEMPT_KASAN                      | 0     =
     | 5          |
>> | RIP:__vmalloc_node_range_noprof                             | 0     =
     | 5          |
>> | Kernel_panic-not_syncing:Fatal_exception                    | 0     =
     | 5          |
>> +-------------------------------------------------------------+-------=
-----+------------+
>>
> The patch that is in question, indeed, looks buggy. At least i can see
> how a use-after-free can occur:
>=20
> <snip>
> static void *__vmalloc_area_node(...)
> ...
> fail:
> 	vfree(area->addr);
> 	return NULL;
> }
> <snip>
>=20
> <snip>
> ...
> ret =3D __vmalloc_area_node(area, gfp_mask, prot, shift, node);
> if (!ret) {
>   free_vm_area(area);
>   goto fail;
> }
> ...
> <snip>
>=20
> vfree() - __also__ frees "vm_struct" where "area" points to. A NULL is
> returned and free_vm_area() is invoked one more time on already freed
> "area".=20
>=20
> Probably it is better to drop the below patch:
>=20
> ff6f2b81eaa8a9fe5d158c6e7b1e58d3929c32c1 ("mm/vmalloc: move free_vm_are=
a(area) from the __vmalloc_area_node function to the __vmalloc_node_range=
_noprof function")
>=20

If drop this commit, then the two =E2=80=9Cgoto fail; =E2=80=9Din the __v=
malloc_area_node function will cause area memory leaks in the __vmalloc_a=
rea_node function  when returning.

Perhaps the following changes should be added.

If the following changes should fix all issues I will send a new patch.

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 61981ee1c9d2..1826f3d70885 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3697,7 +3697,7 @@ static void *__vmalloc_area_node(struct vm_struct *=
area, gfp_t gfp_mask,
                        warn_alloc(gfp_mask, NULL,
                                "vmalloc error: size %lu, failed to alloc=
ate pages",
                                area->nr_pages * PAGE_SIZE);
-               goto fail;
+               return NULL;
        }
=20
        /*
@@ -3725,14 +3725,10 @@ static void *__vmalloc_area_node(struct vm_struct=
 *area, gfp_t gfp_mask,
                warn_alloc(gfp_mask, NULL,
                        "vmalloc error: size %lu, failed to map pages",
                        area->nr_pages * PAGE_SIZE);
-               goto fail;
+               return NULL;
        }
=20
        return area->addr;
-
-fail:
-       vfree(area->addr);
-       return NULL;
 }
=20
Thanks,
Liu Ye


> --
> Uladzislau Rezki
