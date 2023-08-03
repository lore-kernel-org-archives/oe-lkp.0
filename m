Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92606263B4
	for <oe-lkp@lists.linux.dev>; Thu,  3 Aug 2023 20:21:40 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-44758646388so593241137.1
        for <oe-lkp@lists.linux.dev>; Thu, 03 Aug 2023 13:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691094099; x=1691698899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSaRAjLMTa67lFk5QZwB/CpwmOcN1LDlBkoWiiPNHX0=;
        b=S2LXdDKSgccv1prhAF8Z0oKo1xmicxyewP0ylBhuICK2rO/fsSjef3jFU/28NJ3Vh1
         WyXNOi2jAPT0ODKE80piyhpf+XC+KO14qoq4Zoq9pxkFvuS+D2a8yfb562h8HIX6AEVF
         ch5p1S7/7QdkjxqxTnXku3kQTsVPaQDaUh5EfbRUaCprqY2YJTNY+lFJ8hQOdhtnnyJ8
         QqTaODyCa/GBNPH6fxj5g2iNTLieOqvxoez8ocqemnPGBtsl+ns4zbS4tkGe113R9mG/
         EmWP7hTP8mPWwhpZzOshyk7rlRKtsUMGcRFGAd1dhHj6GV5xqfNRF4asRtTybLNxarB7
         Y1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691094099; x=1691698899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSaRAjLMTa67lFk5QZwB/CpwmOcN1LDlBkoWiiPNHX0=;
        b=M3X2KB2h8rlRwdO5UMo4erwRThTxxgJLy644oevYm7X9yOSD3kh/MsifiyHYDpzZns
         bMO3Sd9ROdfFVlSoXos/gas11gxu1fG6Eb02s/jU+/xuBAnfjcHX8LRqz8euHSutf6td
         jbia+tms9c2phfArPANWrnJ595N1J9oCT3nYE9f038V2qlSyolhroJpTnkmkEdNBfy2k
         Ha7l4oXtcq7aQHtTBna9UzxB8NG0iBRf5gkKSN0cOy/ZTTl6YiXoNJtb+OTprFLFCbiC
         +m4sGdIVhyegKhrz0zOhYZX7ICdY6kywySG6+QV5MHPGUe7/JO70GAbYdc0JQ2Wy0y83
         g+gw==
X-Gm-Message-State: ABy/qLa+KRnEC3UimxyJI71o4DagC1dC3wrEELwrmYFPiowSPDHbsxKT
	Jb1idBj9PS2a5jywPtKFGy714A5oAoOezjJnu2Q=
X-Google-Smtp-Source: APBJJlG1CySCstG+XEKldbhygdyS13vjgjak8avQeTacOxbhbG8cLi/Juych8hTizx9FjNhgErCFMh1d0Escb3V3rHQ=
X-Received: by 2002:a67:bb04:0:b0:443:895d:1b53 with SMTP id
 m4-20020a67bb04000000b00443895d1b53mr8351230vsn.10.1691094099065; Thu, 03 Aug
 2023 13:21:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801170255.163237-21-jim.cromie@gmail.com> <202308031432.fcb4197-oliver.sang@intel.com>
In-Reply-To: <202308031432.fcb4197-oliver.sang@intel.com>
From: jim.cromie@gmail.com
Date: Thu, 3 Aug 2023 14:21:13 -0600
Message-ID: <CAJfuBxzq_5skGRkcdK9kJBE_qL8X_waq88XsUO-FHyVQkQUb4w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v5 19/22] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG
 un-BROKEN
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, dri-devel@lists.freedesktop.org, 
	daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, jani.nikula@intel.com, 
	linux@rasmusvillemoes.dk, seanpaul@chromium.org, joe@perches.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 1:14=E2=80=AFAM kernel test robot <oliver.sang@intel=
.com> wrote:
>
>
> hi, Jim Cromie,
>
> we send this report to you to consult that if there is any limitation to =
use
> this CONFIG_DRM_USE_DYNAMIC_DEBUG?
> attached config is a randconfig which has CONFIG_DRM_USE_DYNAMIC_DEBUG, t=
he
> kernel built with it failed to boot in our tests, but we also tested with=
 some
> other config then the issue cannot reproduce.
>

Theres no limitation I know of - particularly not CONFIG related

on an earlier version, I saw some odd transient / red-herring
linker-errors (collisions on __UNIQUE_ID constructs)
on s390, mips, older gcc (iirc - I could go find it in lkp-reports if
its meaningful)
that had me hacking at the fallback which uses __LINE__
But this seems different.
