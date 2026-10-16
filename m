Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1440B4CF493
	for <oe-lkp@lists.linux.dev>; Fri, 16 Oct 2026 19:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792178584; cv=pass; b=XI2sY8d5TqdK4EKkdRWY7xzYu/JG28slkz6lQsWgaB3nOUSfa44mrPyDYk3syhaXFfTjlI11yxCRkC2JwZxnQckhoEf0KWCY3nR5YK2sHLtd21kgcYxmsbf1PutjRc8DGxBLt6Tks2kfFkCatZ3Jw+g931v8jxMBflmc651aKdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792178584; c=relaxed/simple;
	bh=s8YYmvEx2Od01CadNFiHJHUoPJLwLJ90tmxSKKQBNYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=IotQ+/zmt97+ZXoSIRQU7HjYSmsYoeI8Y2ySGpjq4WN+gMnd/OgDxC8ern7XxXxq95sDavo0Gw4mDX21gkyaDy7//0chQJDI59YhwErBfd5fbQgqszFqFAJN1CcLooi9I+AEq15tGMyuhofmhfTdpw0BjP1uP7BrnX2tcrVl8Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZk1O2yk; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZk1O2yk"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c40e30c26a4so135745266b.0
        for <oe-lkp@lists.linux.dev>; Fri, 16 Oct 2026 12:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792178581; cv=none;
        d=google.com; s=arc-20260327;
        b=qH/Yv+xjgEdhPoiAcYO5VTbm8c8qQ8/T2XEEcdYePXHXeQoONIxw8tOHUNhfYVMxTd
         NL5U09a4SLpE9ULDoVALxikb+mgAJ1UErP+g4NE4vlLXrQWsCF/BjVBZIZXMrldQt9JX
         3FCo19z5rLSKRrfgFy3zJms5uNEFv4L8k5CadstoALfI6zg4apKds3hiKgzJcOlvS5hR
         IAzjFLqrcSYoHRkQduHrq88hlfgjIjXiN1ZYRvl0BVKBfq1ebDGDPbxB3gOJmLNbwETD
         YNwVZ1qXTwo9jYixPkZ4Nt6rvbbvzxA8n5KjrnDov7gRHtAkqJwucyI4kuKZ0iSNJWtH
         OEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lTry7xsjvZwTVpMbowQOfU9yrUwhNbDgMizubcJVDYY=;
        fh=zSt0ld3l8KOSwXqltH/jmlqrBuYu6fY0+opbVCe1IYA=;
        b=KTODn8EPlTij+k6KAOBsVwn5FsU4Fn63ApSIemiEdmls7x8IYfbZlh1NTFjmjIc095
         1gTHDd0A5rpIQkJxRDSkSkrByiyVZPNm0BtDTzjdjZhQ0M/iTPRrw1z5Ifsb1BgPL+Gk
         ze786k8uFgX29JVIyFcFfI+QXgzI/lcWeL/dy72fsatEGkhmy3nvzEUY68TT17bpyjHx
         owZn9mj3An5o5n8l4i2LGWW6QDihKu6Cz/89WTZy4xywrvMSn26vmBas42yaNW6UYove
         526jIbvWpBUDgk8omsBd47HWKXdFl3BVy6LHBKI6j/gC7KMPxuU0oSkU3i9sKWDRmr4q
         WzTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792178581; x=1792783381; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTry7xsjvZwTVpMbowQOfU9yrUwhNbDgMizubcJVDYY=;
        b=PZk1O2ykOTxBSLHRjOIjgdjMItvTgEjxxjP2iVpK7T/QniIXnUvIpRH5GG1jKRu7sb
         QiAszJ19Sd4q4ivDosRE2M7RXo1JZKwboHf8aqsPsLXIeBH08s/OfN0JY6+vO5dKoZGq
         DFT5UNALiyw+Uz8mtcidl8TSM+8l5YdsF4O47JMNQP51i1xAWy7/2WVduHwYDdJ7DqmN
         EdauJlEhRbrXWuy4S6mrrdrxdZxcHdnBY3+BT7DDCnABsx8nSfBBeuKB++jD2PJyFAce
         oOTjHIHTqCeZTHZ0xVAqTAHnEI221dPl6swr4LSOOp7nT4uJ68L7rZwIUX1Uj6xJjt27
         vy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792178581; x=1792783381;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTry7xsjvZwTVpMbowQOfU9yrUwhNbDgMizubcJVDYY=;
        b=2eG4Mr3oODGKwbFN3/Xi6WiabJc7Sl3yu6ob7qmNEux+y83AevF+mErxDqMYqZiq9a
         FNOwcFONPeTjpJL6zxSgu8zjZ81REw9M9gHPd4WJcCosssij/UR+nzDSujjtdWf4bg6O
         VqaURfpSbwfv+Tty7A1SvkF421p5WNztW/70qtCTOS/8/cOvrrpOIe8lLwlxaOtW+GAc
         N9tegC/33jrS12mnrRq/oCGlvCFW271/3yQAoQy3LBPBUqBgo3tokTI6sq38q8NTBH86
         5EWZH46z9PKMLEiIgWXFNoYvNZ2X8JdxT+/J53Kn6jVtHEMNKg9dH5V3sXgUGpJv15/0
         IcVA==
X-Forwarded-Encrypted: i=1; AKwUvByREau7zpZ031B9sinjRagYknpw2WoXyiXDyrLDPQ0vx/Bl5N3caiNgfv2YtUXIuQLULzWimek=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ5dXfapRzSE5OByRKDwiPKhakuWUXsQw4OGWkdTBxrTFOqs7/E
	ZRgkR+FhfzM7KFPWEz84NjyVZ51odmLYN7/5oNx9/sp5vSaDz2p6DVClLdvXkSL9l7vx23Y3glr
	utVCboUHHRiRu5RT2Oh+ODwJIY8AKruI=
X-Gm-Gg: AYBFou0UossQwgY+/eq2fSVZHVd6KrCCROFUDQ8buo9HQfYpSyWVuHKnZ04zOpG8/AI
	mEiNRizJOCOiEwebo0ZvqWhz/wLXPYtCi7LrzugAnggogBqPrbuxkbfvxYEiVoWuNf7ODesSzQR
	gJkNWKa4kPKFVzaiPPg8+lByow+VrDXM5uuPo3W8M3jBgYhaLbJvGY/nTbcKrWYZCW2pZpJkXDB
	1TirOrzl/HarSXLDIDs9W98v/3Ib0KTbiG1P9ucMSj9PrODd5crRP5g+5WO29C6QAC4SRN7T2v+
	bjEgPbbl5XXf3b4CVphp32GFeL8YpUHmI+ltPM0/Qe8n2+SCa2bxosd4i4UI4JgTrBBjtAEzpkg
	eAvycou/LzQ==
X-Received: by 2002:a17:907:72cf:b0:c2e:22f7:59c5 with SMTP id
 a640c23a62f3a-c40206fb12emr381976966b.7.1792178580644; Fri, 16 Oct 2026
 12:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
In-Reply-To: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 16 Oct 2026 21:22:48 +0200
X-Gm-Features: AclHuK_M7RSY9_iBEEPP5vYplr65tX4f40PPhVa3RcdPelewIr-u-RWzps2avNU
Message-ID: <CAGudoHExoEwb4o+SnfAA6qZg4qoQpS8LB7jkXf1FefyNCMPbrg@mail.gmail.com>
Subject: Re: RFB: unrolled inline memset and memcpy
To: kernel test robot <oliver.sang@intel.com>, kernel test robot <lkp@intel.com>, oe-lkp@lists.linux.dev, 
	yi1.lai@intel.com, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

gcc 16 started doing the right thing in face of small inlined memset
and memcpy, which will alter performance once used.

can you guys update the compiler please to 16.1 or later?

thanks

On Mon, Mar 31, 2025 at 1:38=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
>
> Can you guys please bench the following, at least on one CPU *with*
> FSRM and one without?
>
> there may be whitespace damage below, should be ez to apply by hand in
> an editor though:
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 0fc7e8fd1a2e..a6f3ef7a67cf 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -181,6 +181,9 @@ else
>          KBUILD_RUSTFLAGS +=3D -Cno-redzone=3Dy
>          KBUILD_RUSTFLAGS +=3D -Ccode-model=3Dkernel
>
> +       KBUILD_CFLAGS +=3D
> -mmemcpy-strategy=3Dunrolled_loop:256:noalign,libcall:-1:noalign
> +       KBUILD_CFLAGS +=3D
> -mmemset-strategy=3Dunrolled_loop:256:noalign,libcall:-1:noalign
> +
>          percpu_seg :=3D gs
>  endif
>
> --
> Mateusz Guzik <mjguzik gmail.com>
