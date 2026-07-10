Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119273DE42B
	for <oe-lkp@lists.linux.dev>; Fri, 10 Jul 2026 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677898; cv=none; b=ZvRRNiPrfa9z2oXQ+6XfYYyHDWaabvH8TPlgjrkX/2mbrj1eUzIfcg2qLTgl7RtPAsd2VNQJlBWPlfPkVRXEu+Iy1+FjahSfYBbDcmotR0030dv8JttmaQ8Xe+mscxNBFkY6/KLRIS99OnKw7x1ZsyjtQFXjkcURjBGsPbgWkxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677898; c=relaxed/simple;
	bh=bgZnDAnuIUe+VsLcYkmYHoPuByp6JTttJ+s/wN6QkWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ia/BPgUCNt606lPVr/O3dq6M98jvdgT/d5aVUhXCsxvbpiutzUpXcaka2C1+JJ147wtqbpBNSZ7Ut0nK9O/WLD7Uc3kZCVWOU7L1juxBnfvjbLUZOjESFByqKyagW1oSfSWy98nsyfWNlUPLncQnpnpHqohqMTiicZpeOJYXshw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ie60D7jw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ie60D7jw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F581F000E9;
	Fri, 10 Jul 2026 10:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783677896;
	bh=bgZnDAnuIUe+VsLcYkmYHoPuByp6JTttJ+s/wN6QkWs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ie60D7jwHXr0cwpVpB39AsLHpinVOftBTuCsLvaFpZyd/bAHic2eYaQzzZ7GyrRcX
	 DrVQB+d5iuEN2nMy/oHP2o2aHmTEBM+zPzyMvxghrQMxRftKjwfVZYhTz4dwt6eU9M
	 DzsbXPdc8iGPiphuEaqBfob5oK5uocTxYzxLfqGvpvtpl2EDsNiG4NrC6hYD6ugexS
	 xoQiHWM8rmkwh22ZhZM8HZTyvDyvT9sqfCdgdjp8ghrskm5NP+Vy5OH/gj07yVUk+k
	 B8Z8eWFBtRK4ZXBmmFdd0r6SFM0yBL6yMgatt+C27DMK8YN4D4VQuzp2PyU+L7AOqM
	 jRYQ+xP65CmVw==
Message-ID: <292ffec0-6a6b-451d-8977-3a5217c65d2c@kernel.org>
Date: Fri, 10 Jul 2026 19:04:50 +0900
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [harry:kmalloc-no-objext-rfc-v1r1] [mm/slab] 6bc21472e7:
 BUG:kernel_NULL_pointer_dereference,address
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Danielle Constantino <dconstantino@meta.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org
References: <202607091002.cdfe5a08-lkp@intel.com>
 <afe80d38-950e-44d4-a729-61aa65d3c117@kernel.org>
 <alCddXaJ4HkjZNXi@xsang-OptiPlex-9020>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <alCddXaJ4HkjZNXi@xsang-OptiPlex-9020>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------V6m3WAHSMa9Jv1iiktisZNM2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------V6m3WAHSMa9Jv1iiktisZNM2
Content-Type: multipart/mixed; boundary="------------iPxkI0pAlY3tmBSQs0WgtLW5";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Danielle Constantino <dconstantino@meta.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org
Message-ID: <292ffec0-6a6b-451d-8977-3a5217c65d2c@kernel.org>
Subject: Re: [harry:kmalloc-no-objext-rfc-v1r1] [mm/slab] 6bc21472e7:
 BUG:kernel_NULL_pointer_dereference,address
References: <202607091002.cdfe5a08-lkp@intel.com>
 <afe80d38-950e-44d4-a729-61aa65d3c117@kernel.org>
 <alCddXaJ4HkjZNXi@xsang-OptiPlex-9020>
In-Reply-To: <alCddXaJ4HkjZNXi@xsang-OptiPlex-9020>

--------------iPxkI0pAlY3tmBSQs0WgtLW5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 7/10/26 4:21 PM, Oliver Sang wrote:
> hi, Harry Yoo,

Hi Oliver,

> On Thu, Jul 09, 2026 at 06:26:54PM +0900, Harry Yoo wrote:
>> On 7/9/26 5:48 PM, kernel test robot wrote:
>>>
>>>
>>> Hello,
>>>
>>> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,addres=
s" on:
>>>
>>> commit: 6bc21472e7eb9f8c771ffdf86266aa6d9dcb1dac ("mm/slab: prevent u=
nbounded recursion due to obj_exts in free path")
>>> https://git.kernel.org/cgit/linux/kernel/git/harry/linux.git kmalloc-=
no-objext-rfc-v1r1
>>
>> This is v1r1, and I posted v1r3, because it was bootstrapping sheaves
>> for normal kmalloc only. This crashed the kernel but was fixed in v1r2=
=2E
>>
>> Apologies for the confusion, I discovered bugs after exposing it in my=

>> tree (force pushing isn't great, you know...) I should probably have
>> deleted that broken one, though. :)
>>
>> Will be posting v2 that fixes false warnings w/ memalloc profiling
>> debug shortly.
>=20
> thanks a lot for information! sorry that our bot still cannot analyze b=
ranch
> version so far.

No worries :)

Is there any way to tell the bot that a branch is broken,
e.g.) deleting a broken branch from the repository?

> we will check the latest branch in your repo before reporting
> in the future.

Thanks!

--=20
Cheers,
Harry / Hyeonggon

--------------iPxkI0pAlY3tmBSQs0WgtLW5--

--------------V6m3WAHSMa9Jv1iiktisZNM2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCalDDwgAKCRCGXBN6rc5S
1rNtAQDsPHuMpYN3I8TXdZ/lV71OWDWJ+P6u+SAkNGwh1T3ITAEAw/YZZDhQB4jz
0g+m/gEmAqFtRBolTTJBFnGyh55RIw8=
=ppkB
-----END PGP SIGNATURE-----

--------------V6m3WAHSMa9Jv1iiktisZNM2--
