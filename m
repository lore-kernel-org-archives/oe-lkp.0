Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B79E15495
	for <oe-lkp@lists.linux.dev>; Wed, 18 Oct 2023 08:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="S0ZJDwl7"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c4fe37f166so79240601fa.1
        for <oe-lkp@lists.linux.dev>; Wed, 18 Oct 2023 01:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1697616752; x=1698221552; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8OSgkc4e1dMirZuYakBJ4TV+Pc4xjV8sddnOYMm7jI=;
        b=S0ZJDwl7tA5qSWhbuNGyOn8rG91ywNs9P5FJiH8mcY89eIceIzcRcmDyMUlrfKiPbV
         Napwa8MjsmxWvVj0t38aavY5jEY7qmj36mhY6a+S/hJjEIoQz7RrCkxWPXd63kODgF/5
         I+d2bdJflBXlPUWRnG885Bwp5esQK/q4BfYLNVgLw+w9MbE2ijZDWPvqKsRmzeh1TTMJ
         fsrr0NzXLn2Sq8V38S7I00DOdXRJPJvrjQV65gzF/WH3nDv+iYrrMVUOgVtXzn/E/hT7
         9R1Alkqa7lFYLyh+RolDY+rLqc+/B6f+hBl7qoMI0lUakSWEib4stR2wKtnpeh7PEfe3
         zj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697616752; x=1698221552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8OSgkc4e1dMirZuYakBJ4TV+Pc4xjV8sddnOYMm7jI=;
        b=o/kcNgF7DZNNnkKvgb0ys3j3KL16lChz+vX3Wt37NCR0bChV0ae/WP5tW1Snbad+8y
         kp2GgB9dmCh8imjuZT9xcH9jKK1VlMO/HKu+/P/jdrlginxp4X2b3UqhqLXf2nrocXSU
         V6zV+DIfeKS9/wTlbXV83uM3vGsdkYs2g1TIuStmxPrpykVC98rffPFYAH7C55Cy34oQ
         lvURzgL50JZ1IFiWI0JRzF5bRyXVGS+16TlTe0M2SVh85KCbSi2Xe2phyjCkLVr0chno
         VDOw/sYbatI/grEQJd5qcvBUCrVYPkFEtFypSzW1YPJcu9Nl/jyy1zcUpQZJJp+ZZA33
         RB3g==
X-Gm-Message-State: AOJu0YwJjgPgI1HbvZZWYxrYcwnm8aeCQ9LWSB3M9o+bjCH6JUcH4dbb
	wL52mx6P9FXMewJhZgmhXh6PW0fXGYKEIKHygJKoQg==
X-Google-Smtp-Source: AGHT+IE1yL45y3giHvGlWwiGV+n0AcnmEXxcJzbz2rJTiP59KR/TOfhDFA2cpbwe0KAkULT4qqNUQ+xiX331N5X+lz0=
X-Received: by 2002:a05:651c:1989:b0:2bc:dab2:c7dc with SMTP id
 bx9-20020a05651c198900b002bcdab2c7dcmr4120154ljb.47.1697616752372; Wed, 18
 Oct 2023 01:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310172247.b9959bd4-oliver.sang@intel.com> <2023101759-front-ember-6354@gregkh>
 <ZS+EKPJA+BMhM0yO@xsang-OptiPlex-9020> <2023101836-backtalk-mystified-d197@gregkh>
In-Reply-To: <2023101836-backtalk-mystified-d197@gregkh>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 18 Oct 2023 10:12:21 +0200
Message-ID: <CAKPOu+9bZtu80NncqLET_ycZcWynZFHuWGRC4HU2Od9NrsjnCw@mail.gmail.com>
Subject: Re: [linux-next:master] [drivers/char/mem] 1b057bd800:
 stress-ng.splice.ops_per_sec -99.8% regression
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 9:57=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> That's odd given that as was pointed out, this test does not even touch
> the code paths that this patch changed.

I think I mixed up the "vmsplice" and the "splice" tests, and my
conclusion was wrong, sorry.
This performance regression is about the "splice" test which indeed
uses /dev/zero. I'll have a closer look and get back to you.
