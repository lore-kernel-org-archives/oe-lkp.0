Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793852558;
	b=F3gWri+TZK4TlCghMn5kdRHoYWy1SZuSx7uUTKniEoWqbpO2su7AZz/pF4ybpRK1avNa
	 j4E7cBfXZ9AE4lY2TROwjum0ib4x+VpU04DEhevdAzsJ1cmn9F90xy58LpqUCruftDigp
	 UxEcdzSlZQtpvS8eWejWYRl/b7HJnubwRgyBeog1l7gmQ7iwtCQCHcRWzS5B1PTyL0i5n
	 SSVP8sWvjEe1FGsWUV7IEe976ZECViIp+82Cfdv2CcZz6wqUUxFNBXJTYJDKcwjnAVyV8
	 DzrRbcK6B9svHgP1AYPWgdxCRm8gPCtrdVpz/Z24odjvYiObv36PTXiIP0SdZCWgzwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=rU/4KhKmMNOMVfPO4Ct4SOXNAKasoIJ7Z9nUaXuCxpE=;
	b=4R/DVhTAGlt4HfYnNtvIcxWvLQoNiNoQibIeDWOroLkBvLM3Psdi86PbzXGpJWYUicAC
	 P4j0J/SVl6Wx3Fmnngj2BnrGjyQD5PdCrLeJE14JVOgJokh95OVj1nwBW8euizk0WwTF2
	 OKmlxpjCyHvX4SRNOIpACHv/RRHl7f4vwXChmVcgY+YYyPVIhxsnPrraOTJg5ZFk9Sp1+
	 pn9F4yMma6rvgFc8Q7o5pwxmZIb4DOP4YG3u4+WC/BLbg81MnKNBpff0Yg/4YcLcHHSWD
	 CousHPtqAF17STfXZQBYTfX2qrzh1AGczf2fdrQMwhuP4R/GSRb35Cr2o9D6WFX6H7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TwdU09Vu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4AE606A329
	for <oe-lkp@lists.linux.dev>; Thu,  5 Nov 2026 04:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E4AE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TwdU09Vu
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533202fe429so166801cf.0
        for <oe-lkp@lists.linux.dev>; Wed, 04 Nov 2026 20:22:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793852557; cv=none;
        d=google.com; s=arc-20260327;
        b=mZybSXVshm8aRjLD6F01XcEupcXduGlpWKyoUcucrFiCsng3iO5+11nB6HFu4gKQ/h
         S34iOwDmWQQAy1HXz3F6KGIFI3kbW1hOaYlvC/W5+373sycF+79HHBmH89q5Vb1bqIRo
         nJpMVJsSalOxdn0rS4gUpG5e2cTpJxR9IDKS6AdKTo8ns8GejKIoODNizTmp0ykCGLNi
         NAIzPRFXUMsukSiQlTOQMppW7LXVjXt1fzta9ghZ2B4MHrALqhW7Stu0p1kklpPaptIR
         tja8fJJ5ssPtj27wCn/wyy3szZESgYLDVq/YRWzpfpTfQpZvAzda/mO3a8N04JTcKwVG
         OR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rU/4KhKmMNOMVfPO4Ct4SOXNAKasoIJ7Z9nUaXuCxpE=;
        fh=H57Tv+IaSHWlKM1QY5cm9eMC2ec0VYsXjGUtPZ6AgEo=;
        b=ISB6pvR5LKuvbOOMEwVFL4Xy5QFyzta/Tnq+9awedgCuYeCEfFzFbsYGk77+FV/QGP
         EA7BI4BFP8V/piu03gPUBYOsWtbgj0ee9/xAowv1NvfpqFRFhR8gR9n/C742OoEKjZI1
         WkfcpUlIjxuhtwFugw6x9kNiEVqOim1uzJ4aVsJUbkDvC0PCvqqOJd4UtmBdrEUbqXU/
         s/cTw2fGYPwwQutzfrtY/ywnU728fsvmgC5XONCrDlzCMImio1PwOL1E+eCwxbOUIdK5
         SXB8VQaUuy7Hk83ajO3JG8HUChnsmnsXd4xeMy1mRXD7PX45bv5BbRFEL5vOohIPW0h2
         rnJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793852557; x=1794457357; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rU/4KhKmMNOMVfPO4Ct4SOXNAKasoIJ7Z9nUaXuCxpE=;
        b=TwdU09VuMPpLtWBUYQLY4Pgf7q60/e6NXoObprDj8G+YOPzjgUyAURZ+9YMgcnMY8z
         QMJzXAlV0gcdAhhmR02wCZYIpSlJz8zeb/VyuzC+4eUggUAk0ZeZgDUUZZAuiNwHxk8l
         YYe9Md0+MpTOAEtOP2eHRzdKCyuqZlqn2WoZMa92cjetqUfY7W/kqvA8eWxDCH8WsMmC
         f63r6bRTxYP5BcO+LzOdkoovCnp4IFPtUUWvJISuiThqm/bX4UNvrA9n85iYQsaY5haS
         fK9nL6u2MqqC/6O0PHvLdzy7kHKl4ZkYfTg+sUCKZLGtsYjqSzJGMWJaFJV/y98/25mL
         h/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793852557; x=1794457357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU/4KhKmMNOMVfPO4Ct4SOXNAKasoIJ7Z9nUaXuCxpE=;
        b=GUmMMYd4uTIlypPOxavkAa//dPPVjFExo0feEvg84EhpziVC6A8wM9fHKR9pjjCxfs
         zuoqOa1uYEwH2ZEuabX2cKG+UmNFypPBVwVQw9c91ILJFQX1tdZTNOCE9yvY8hJ6Y8BU
         LUeq3JtPaWxFJ26Lb+7YNshddHpdj70RhXDibL2ji3ROjjIRC7DU2h/4Zc057EwT6q/o
         qjeo/orxta7+sbYXN4oKOwZ1uGJxNVDbRDU40OTRSbdl2EqUabQRkJMWeAGBJxwtxABN
         Z4VpH1kfFhNe/Aak6GOjCzAX8cqi9aEOywTCMdBdVPvE9fqpUcBcUCguKp6+Vzf36ISm
         /BlA==
X-Gm-Message-State: APuU4Z+TBgsSdj3F83ZwbeeGi1pAbWnTvONOvdDPZ4E/eG1yt028Ogvj
	6inj+rlBcrqCG8B/sxbArpQG5VYB0lTbs94yAE8tIPj+py3UBXqpUC8dk2A2qgCy+5a6XAO0sNN
	BLB6VSCWxHK2470KtWSx7NXnANKea7oW5VEWwmj3C
X-Gm-Gg: AYBFou2SiksSGN4KtCW+opQ8hjbsTroBU8MpPakQUFzYk+l7GcfRzeQEcE7fSpR0D3/
	E+qvvkk9Z2VCniEMEMP/fczrNuyI6+DTh8jxOyb8leqtTJeGos2EW2j3dzeRi9xvLAlAp53ROvB
	UTgueIaxsNCruRIK7Ecd00bJ7HDTrocoRylCajZwkg1z5+fiebacN619Q3lx1w7VV/azpNTeHVj
	/c2yKTYyGCEbDJwdKDZiJ+s3iulbEA533jm12Zv8+Fa9v8q1tdb91SMepGedXB8maG2Gpp4v0Ly
	wE99htCoG6bci7Rmm9X+WAwxMQ7pipfoKhF6YL0P4ThA5H65FuY1CmdM5QNbr02MDSZa8rX40my
	fmcQh/+t9qpB8he8AvTi+uRKV3T3Qdbhyu+zGog==
X-Received: by 2002:a05:622a:90a:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-54cb0bbd967mr11728581cf.4.1793852556274; Wed, 04 Nov 2026
 20:22:36 -0800 (PST)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <202611050912.2cdf1ff5-lkp@intel.com>
In-Reply-To: <202611050912.2cdf1ff5-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Nov 2026 20:22:24 -0800
X-Gm-Features: AclHuK-N2V612YytHJhEuD7FLzc60lFV8mbdHb9a1ldBGi0Aa4UQbVv_1U8wafw
Message-ID: <CAP-5=fUk4Q3PxNiqwHtyM6XTt9LGZaTe9p7o9k2gL7f2LBRBHw@mail.gmail.com>
Subject: Re: [linus:master] [perf vendor events intel] 31efbec216: perf-stat-tests.UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU.fail
To: kernel test robot <yi1.lai@intel.com>, "Taylor, Perry" <perry.taylor@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Edward <edward.baker@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 5:47=E2=80=AFPM kernel test robot <yi1.lai@intel.com=
> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "perf-stat-tests.UNC_IIO_NUM_TGT_MATCHED_REQ_OF=
_CPU.fail" on:
>
> commit: 31efbec2161d2d31b020b086958e41f35f070a38 ("perf vendor events int=
el: Update sapphirerapids events from 1.39 to 1.40") https://git.kernel.org=
/cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linux-next/master 7649ba73f9e7e1e04d0b46213e39c79ae09dd55=
c]
>
> in testcase: perf-stat-tests
> with following parameters:
>
>
> config: x86_64-rhel-9.4-bpf
> compiler: gcc-14
> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (S=
apphire Rapids) with 256G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202611050912.2cdf1ff5-lkp@intel.=
com
>
>
> EventName: UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU
> 2026-10-05 17:15:24 perf stat -e UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU -a sl=
eep 0.1
> event syntax error: 'UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU'
>                      \___ Bad event name
>
> Unable to find event on a PMU of 'UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU'

Ok, this is an ugly issue. When we fixed the issue so that umasks of 0
weren't dropped, we added new umasks:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3D31efbec2161d2d31b020b086958e41f35f070a38
```
...
@@ -1923,6 +1974,7 @@
         "PerPkg": "1",
         "PortMask": "0x0000",
         "PublicDescription": "UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU",
+        "UMask": "0x7000000",
...
```
The umask calculation is odd:
https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.py#L361
```
        # Combine the umask with the umask_ext. We don't know the
        # width of the umask as we concatenate the strings, removing
        # "0x"
        if umask_ext:
            self.umask =3D umask_ext + self.umask[2:] if self.umask else
umask_ext + "00"
```
For Sapphire Rapids the UMaskExt is:
https://github.com/intel/perfmon/blob/main/SPR/events/sapphirerapids_uncore=
_experimental.json#L17422
```
...
    {
      "Unit": "IIO",
      "EventCode": "0x8f",
      "UMask": "0x00",
      "PortMask": "0x0000",
      "FCMask": "0x00",
      "UMaskExt": "0x00070000",
      "EventName": "UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU",
      "BriefDescription": "ITC address map 1",
      "PublicDescription": "UNC_IIO_NUM_TGT_MATCHED_REQ_OF_CPU",
      "Counter": "0,1,2,3",
      "ELLC": "0",
      "Filter": "na",
      "ExtSel": "0",
      "Deprecated": "0",
      "FILTER_VALUE": "0",
      "CounterType": "PGMABLE"
    },
...
```
So that's hex 7 followed by 4 zeros. In the generated perf json it is
hex 7 followed by 6 zeros as we concatenated the UMask's 00 to the
front.

> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255

This error indicates that the UMask for the IIO PMU only expects
values from 0 to 255.

So something is wrong in how we interpret the UMask and UMaskExt for
Sapphire Rapids' IIO. Could someone from Intel take a look? Is the
problem in the original perfmon event json, is there a different way
to encode the UMaskExt for the IIO on SPR or is the IIO PMU on SPR
constraining the umask too much?

Thanks,
Ian


> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
>
> event syntax error: '..O_NUM_TGT_MATCHED_REQ_OF_CPU'
>                                   \___ value too big for format (umask), =
maximum is 255
> Run 'perf list' for a list of valid events
>
>  Usage: perf stat [<options>] [<command>]
>
>     -e, --event <event>   event selector. use 'perf list' to list availab=
le events
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20261105/202611050912.2cdf1ff5-lk=
p@intel.com
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>
