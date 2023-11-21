Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A50F56776
	for <oe-lkp@lists.linux.dev>; Tue, 21 Nov 2023 16:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1kXL3Bd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cf5901b4c8so23961465ad.1
        for <oe-lkp@lists.linux.dev>; Tue, 21 Nov 2023 08:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700582733; x=1701187533; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmJ5foKdCDZg8tIi4TPGeihCrXCC5qbN8sSmRpGmvoM=;
        b=k1kXL3BdhNeprnE+E94p1pUhe0Cz7R+gXUDmFAx8olVIMzHq496Lm9Ind1NZNnu15q
         +GVURbZgfUCnxAG69u5fVnpmSra3xKg43ipJDQgGA5u8P6t+GX6QkBbC3PcbM1bt9ZHv
         t7Ht80esaa9iPLIQf6X+Wi4gp4CLuT6OZnEwToTWaCzON1O67XazMu7SLcfLwb0Edn1Z
         FKIbgZfF4Xzi8tCYQYclXjqzmIXiV07Idq0UQ7G/LMbhBpdOHtCJpldxL2IR0nWEcoVF
         xeyZTEDjCZc0yzN/nowVvkOrJJeY2a1AnDOE3LX3NL1vwHVRKNbJ1siEOTrhqcZXC5Bp
         UJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582733; x=1701187533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmJ5foKdCDZg8tIi4TPGeihCrXCC5qbN8sSmRpGmvoM=;
        b=KCd9iw7xBB77XSWQ/pVmiB2U8kZqsLdNYBA1J4rnbDzp5349nv+QQqTtsGfbvR5YAI
         pXqUQUmI1PPX/22kSkYDotejW2ngWT0ZIYKCkKDQRpvDo31i02XJSGVJCouCVTF8yQLT
         yjm0ce1uER7eyOhTRDMkocLcdy6Gi1pGHNBBNieWRaYBjvinEHxM+j8UTenkBqXDn12/
         kBEplK2RAPczRpYLlUgUTJsGi1FQ+CDECiCeEmN8fJcP5K703B0UlNIpsOVIQtgqCcRx
         +WZhxf3WeoDHsQVSgMD4dGcuv3jDArRIniITFnbVc3WM88hiu8SBlH9ZOYX34h7rc3Xm
         QKhA==
X-Gm-Message-State: AOJu0Yy5USsae4ovcFA7imvlBgdmUVHxVoxx4l0wdQ5X5zMJ7VWH07S2
	qx3m5NNR0DO0cMT88crZkmeXI7SOKCEYgsXOO38=
X-Google-Smtp-Source: AGHT+IGuQALslBqctoJ8yEzlNidGXCIbHB7HvO1+wbKEsxysx7DJQ6t93Ms9KX1AS83Umdf9IaOlzK+sSVY6I7jeYEY=
X-Received: by 2002:a17:90b:38c1:b0:27d:d9c2:6ee5 with SMTP id
 nn1-20020a17090b38c100b0027dd9c26ee5mr12266549pjb.9.1700582733189; Tue, 21
 Nov 2023 08:05:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311212204.c9c64d29-oliver.sang@intel.com> <VI1P193MB07520067C14EFDFECCC0B4C399BBA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB07520067C14EFDFECCC0B4C399BBA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 21 Nov 2023 17:05:22 +0100
Message-ID: <CA+fCnZfTJwfmO-OYcUst0fsWhRa+MzDtkv1N_bMob9_1BivdJA@mail.gmail.com>
Subject: Re: [PATCH] kasan: Improve free meta storage in Generic KASAN
To: Juntong Deng <juntong.deng@outlook.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, ryabinin.a.a@gmail.com, 
	glider@google.com, vincenzo.frascino@arm.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 5:03=E2=80=AFPM Juntong Deng <juntong.deng@outlook.=
com> wrote:
>
> This bug is caused by the fact that after improving the free meta
> storage, kasan_metadata_size() continues to calculate the metadata
> size according to the previous storage method.
>
> I will fix this in a separate patch.

Hi,

Please send a v2 with the fix folded in instead.

Thanks!
