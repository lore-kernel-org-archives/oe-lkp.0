Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793894269;
	b=PuEYhKDF69ozE8zi/xkZ65BLaJbmPhTO1zfAgeoMw4lm046eBbiHK40TuAc/bpRyC3qY
	 wX1am1W0B5+12OGTurVllbazQbMQHAClF9/uJQggu8f+3RbvuBkec9/wJEYcgB1Zl9oWE
	 ejpAFou3e4nKpkgH2CKmvAaWF1FPtO8LG94Ba619r3pZ6C2mv+kUFpA8a9zemPglxh5tm
	 NMvxAYJvunbaV9dYu8k36qgNCrtSn2gn1QlqWsD9zLEDjQ7Yq7lqUzUDyuJqY5KIpsaIW
	 EVSFHpaMisz6tL2S3qOpHBs6LtqpSXdBouUoh/HVOdGaXegIK2qYAW0M+cD8box4jiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+QzyelSArYy7hz0DLVg2HvT3P2ld88WZrMke4YQyrAA=;
	b=2awV/Hqf8TCpQH5aUspNcX/3u+1GKTuZPd4a/GifacXg6U24h/Bo+cfKHAsOlzPCzO51
	 KWkd+x6GkAWpyotgQ0nB7MDoWZ/qkMUyAcaqcPey3A0nAyo21KO+MelYgxf1m8ykyNuaG
	 bUSbJJqey4+r2VkrERmwxUkrcTH35MKDnflhIuejMjyVpGSf+qka34pBlF2mW4XzAlTCu
	 VnkQirvw0PpZYTuu3/CxdFOhRsk9Xrp6c76/IH9s7VryzAmkPKpt63Pzj9UMFqq3COqUe
	 GYUQoYeDeA4OtlTPl8Qr0t+YfSBzHBgHTUVdgu2znhW2bedtGBFEAX+rZr5xyg6aPtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcfV3QpP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A786606BE89
	for <oe-lkp@lists.linux.dev>; Thu,  5 Nov 2026 15:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A786606BE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vcfV3QpP
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4c9abc1824so319834566b.1
        for <oe-lkp@lists.linux.dev>; Thu, 05 Nov 2026 07:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793894267; cv=none;
        d=google.com; s=arc-20260327;
        b=Db5o/EVFq1lkv+rdVm5yHueSpMK2ojHQuAePu7tTjH+JIU1RIaS46evIliubJqA1q7
         VHnHJSHMpEzq4t5saAMtmMLfKNpNBvpb0YEytIg8PGFQGVhx9kLl7ndNqVZkqahNzBfQ
         2Nk1vemSWyckN3U2b9PmHyp0z7y/0W+ge0pOrA1QN7V2m0BROD8V44EYrMqBpbv5qzeW
         b++hh89G2l/j2//pRkJFCxcsqnuMikBmrxBCw2kaUlRJ0bQjCZI/6JSJiesfNVhlYrT7
         aLI0oEALJ13jwWrH3f+qp156QZhpghvOSDnCBNQiDpFbRAHPsRfGDsMWcscSGKvx0YcS
         glaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+QzyelSArYy7hz0DLVg2HvT3P2ld88WZrMke4YQyrAA=;
        fh=sZ08hegsWI3IS3xFI321lejZj8CGc6lMDvLWczWekKU=;
        b=Bpxuqad4y0AqHJml0GchQQwzI1X3ecI7SZYM2BMVPIqgKL19woJU50O7v3pdk9d9km
         tCjPir44mcACklmFWCURtpxm0xsFZv+6gNIlQs3posPgeoivSyDVbjumL3dXq1ZwxO3P
         hSjHqs/jBZbB+p2s8IGzldQRALSR+InMxIWaE1+AmN0ZB9nHW+gaMZblVjBHbrP1rhml
         C5sg60t1yrtl6kWsg361PqRyVlS1evlfhZPt6I/abrODpqqMQ1PkzxFK/PCh7YQvK95b
         aOowqMYEXfw3myjyS391diLDgIgMgxVku3CnR24eKkP2T/7MLM5Zc1H6eBgc1HrCdL0l
         9lgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793894267; x=1794499067; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+QzyelSArYy7hz0DLVg2HvT3P2ld88WZrMke4YQyrAA=;
        b=vcfV3QpPlTHYvmcKc1OcWwNSccjxX4VlwOexMS10GhfeG8IsyH+1fhj0bGbX/mc5LA
         dyUwu31lJckf9CjrMfsuNbHI3Asx52gcd2BnstCUxiq/ceyD6yXwTglPVpIRyG565iW4
         4FLEce8iN3PN6vCvpDnl2JCuX8rfuKiwcE5hR6p09VRmH170Oe0AFF8uAkJD87r6yIsP
         wbNzwS/EFqNOViuE/FB8hBcxeNd+LZlPQ9qZVdZ5WR89ccyYNWf2RlWTaH8/EDQKyZvK
         X612HMvzpIKb/or+Qdon26T/7uzyeZBMcmoP/m4K0wjCckZczWZBkROnlFVVL6ST3ho2
         taqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894267; x=1794499067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+QzyelSArYy7hz0DLVg2HvT3P2ld88WZrMke4YQyrAA=;
        b=DJsazJOplmu5gDXr4Yn562ONS4t4SDfaDAeTtotw+kLMf26ZoNjEgBEqBjn0rEwW57
         AziIC7VDREgFZLkZDeFMyuAQB6NjCBwZRG8x7A1At9oJet2LIv0llUeyiiUdLf4Zt+QI
         avqbiCMMrrFXkDeeUYAxrj5gryPG+wYFqduERZywDkGB+p8fZKd9IGYgJoEzJv/nyb+y
         aGAPRRN6BEf03r76QjyuRHvx9St/wwBZwLT5y/lUKLvHg8599Cd/W+8R/F8ZoWVXcqB5
         esiNsioVygIaU9G4+6J3uvtsa4Mykw43WpnUDjm9hKrmYSA4+ESndxxA1nbu6jHBxJ0n
         MuEw==
X-Forwarded-Encrypted: i=1; AKwUvBx+1IkuWCzj+Z8FPFiwxWpFhDepOUzEbEfNjIPMSxqjeacAYfDK5CtS1MgRqtSRe/bw/TeUPV0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/qbmvXoq1z4kC1K7Ah7My5vImOxTSuIwesOrPcKvgrjJ1nimOG
	f4Ss5wpDAwunbNz3zxj928uLUSmcEyAaRzzA/Jt5o6Ex4Tf1vv8+kw1fO13kePYOv9fgx0NWzK2
	IULBDQoEBuO0i57jTzh7KYAnZYzXHczY=
X-Gm-Gg: AYBFou35yAJKlVJ/mPGqpJOVPxN9Ij8EJZoq57HrQwQMJqK3IOcGESgsQZ/inpOPwGi
	wpVuAxxJtyI+wUOqT2olFoPjJ4s6B6qWEMXXCWaQ45oLVQIBMnUAdRU2IeedtEB3nLLz7P8qw0y
	06wOzWK4snPSw/6p/MjJ92Ua07qXX2dGc7yJAdu9FmqxfmsevSog5UcaFhD4Zj9TCSHDfPtfN7k
	5Piz7av7BpbkDGJv3BYM2e2O8txKM14g7P1k+4GYXZnyXwQojGBTteymYXNBdqb2mvIfO71fgWf
	ZRIA9Li/pEIZ/F58yaG8N/ltPqK/wXwFxS4FbA24hf6LgB9FX278KaO7R0sXGV/VN0xkafh/Gu7
	yZHppZvx0WKV8kAHmOJVF6N6PxPPP84uuGqs5aQzJvPLDyRP7jo87waXU4zkypV4am6CN+WQz/y
	uYmXP7zl6D/gJ211hb9uMzp/YASPgu
X-Received: by 2002:a17:906:9f92:b0:c41:5970:2360 with SMTP id
 a640c23a62f3a-c4ca7ad1d1fmr1680110966b.41.1793894266551; Thu, 05 Nov 2026
 07:57:46 -0800 (PST)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <202611041404.befe64cd-lkp@intel.com> <20261105-trommeln-einspannen-radius-ccb4e174e407@brauner>
 <auygOHcuBba_o132@gmail.com>
In-Reply-To: <auygOHcuBba_o132@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 5 Nov 2026 16:57:33 +0100
X-Gm-Features: AclHuK8uwevQcSqxti_mw-yTSusmg_LuBdQex7a7cWEVSFUXj3Ulzz1Lj0cR5z8
Message-ID: <CAGudoHFpNbxL13ZOWiyyLSPpmzXcB=e=RBZ8ZGk+Oc58Aad9pA@mail.gmail.com>
Subject: Re: [linus:master] [fs/pipe] f7f4665dc5: lmbench3.PIPE.bandwidth.MB/sec
 18.5% regression
To: Breno Leitao <leitao@debian.org>
Cc: Christian Brauner <brauner@kernel.org>, kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:28=E2=80=AFPM Breno Leitao <leitao@debian.org> wro=
te:
>
> On Thu, Nov 05, 2026 at 04:04:58PM +0100, Christian Brauner wrote:
> > On Thu, Nov 05, 2026 at 08:38:45AM +0800, kernel test robot wrote:
> > > kernel test robot noticed a 18.5% regression of lmbench3.PIPE.bandwid=
th.MB/sec on:
> > >
> > > commit: f7f4665dc520fd8bbc1db20e59945773e03744a0 ("fs/pipe: unify the=
 page pools into a single per-pipe pool") https://git.kernel.org/cgit/linux=
/kernel/git/torvalds/linux.git master
>
>
> > @Breno can you reproduce this?
> > It's something we should at least investigate.
>
> Ack, I will check it , but not today unfortunately.
>
> I will come back to it tomorrow, and until end of week I will report my
> findings.

I figured it out.

The test at hand has multiple readers and writers using the same pipe,
with 64KB i/os.

Prior to the patch each writer had its own private pool to draw from,
guaranteeing no allocation will happen under the mutex.

With the patch the reader exit also drains the pool.

As a result tons of allocation ends up happening under the lock again:

-   94.88%    94.88%  bw_pipe          [kernel.kallsyms]     [k]
__alloc_frozen_pages_noprof
     94.88% __internal_syscall_cancel
        entry_SYSCALL_64_after_hwframe
        do_syscall_64
        ksys_write
        vfs_write
      - anon_pipe_write
         - 47.46% alloc_pages_noprof
              alloc_pages_mpol
              __alloc_frozen_pages_noprof
         - 47.42% anon_pipe_prefill_and_lock
              alloc_pages_noprof
              alloc_pages_mpol
              __alloc_frozen_pages_noprof

I don't think multiple high-volume writers vs multiple high
volume-readers is a realistic scenario and I would not bother fixing
it.

However, should someone want to address it, I think the patch should
be reverted and the resulting state tweaked. The patch at hand came
with some win for throughput in one reader vs one writer scenario,
which I'm pretty sure stems from postponing page deallocation until
after the mutex is released -- the kernel prior to any of this would
still put_page on the reader side under the lock. This bit would have
to get tweaked to recover the loss in that scenario (not to be
confused with the loss reported here).

tl;dr i think this is a EIRRELEVANT kind of a report
