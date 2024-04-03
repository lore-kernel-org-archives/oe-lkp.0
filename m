Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4494E14A62A
	for <oe-lkp@lists.linux.dev>; Wed,  3 Apr 2024 16:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712162747; cv=none; b=GVNjLyKzbmJW66ORlBLPJhPB7a9gQnqA8mJPO+GJalN5ldXZhq5vuz81lNOim4aPK9eNk6/lMm5dCPwMuHM0DJJlcmSbZW2p+ujpSphVaIK9FQ/+nvLEm21DeInYHx6K/TtrDFskuV5OzM7sNLzLgl3nUAmQQhPaxppo3ZCnfbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712162747; c=relaxed/simple;
	bh=WkOp0jt83v59PmTbpG01/8bMvUonlZp+wBHAUkpikYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LvcnFbN1RjMi2/sHlBJGvgvmClT5PXyU7Q5RDmPPjBEmiPtn+w/K3nTQyjdm9KeTKIwNcrqqgjrSSbq1o2YqJV2yff44tPToVYiLyz8lgzApUH4BPeR2RDZTn8a15OdhgYUCunWAsx+pzC4PM0yUMK8m/Wb8Bs6hUlIc+GjM5qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aKar6QGq; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aKar6QGq"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a4715991c32so11929066b.1
        for <oe-lkp@lists.linux.dev>; Wed, 03 Apr 2024 09:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1712162743; x=1712767543; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BA+iBcOT7cJaTUdOkwv4QgkljAgFbNor67YZYYCKl/4=;
        b=aKar6QGqceuB3+QKHRlNvTc3h2SlbJFud4wPNz36fPLldEsI7H2TKLOkrh+uzd94Wr
         eusEj0t52XIHKGTf/loD2YzaF/OI86s6Q130ykTjLSCDiFmY7sLf3N8T3d9SDLQlOyS6
         W9zoA22vRY+x5DAgQS/vXPmS86ObeP7Iz32Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712162743; x=1712767543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BA+iBcOT7cJaTUdOkwv4QgkljAgFbNor67YZYYCKl/4=;
        b=A7M1uu2GIeXSoJ3eTa2ghTVPBg87zcCxFSuUfzHiFa4vgNChRZeW4X0/d+rpgbXFc7
         KF+uFmriBpdbUV6eLH9Jo0yapGMokW5BSMMvrWssvIqIl+bznIveqQafjuLt4rm0duGn
         xhY84zSgTqxfOGTEEZ1V+IFJtdeor9GVv1yWUlvh6FCgmh0A5+kwSPSjL61tX393+6ZO
         CiN9LrSs0jvZAKdWRichhfoooXmAqvrGtS4/ReTBqnmU0naCLtBvReG7CZrLqQW9hEws
         1xMPZ03Ml07yykJFGOYbLaTyxSDOPQq350+h7uaAnCc9NAIaW0hsyG96qGjInUpF6y+z
         J7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy1FsFyUnycSQGuzde5D370ZKdmGACxj2KMYNnue5IT+6kobjp1kU9mcF47eIYUElUoMkXeProi/Adnh7gOGsYkBa2+Q6R
X-Gm-Message-State: AOJu0Yx858AnP/4eCHgg/et+G0NXdyIVcrPCkpIEP9UacUt1QiAAV1RG
	V1/w+d4rMkfDCtnMPKp0+MXotpIl1bJSQzi8xQydbTlnTp6ce5YV3OCG5Ds6oC6pPAMiIQ8PoE8
	PNlPdfg==
X-Google-Smtp-Source: AGHT+IHrZQZAgZInUTAkTRFTm7fIYR1d++3W4phRwFYU2wxV/KaWa+pYjAuEj2vfeHj9q6oMq/LE8w==
X-Received: by 2002:a17:906:ca0f:b0:a46:f69b:49b1 with SMTP id jt15-20020a170906ca0f00b00a46f69b49b1mr10426229ejb.46.1712162743348;
        Wed, 03 Apr 2024 09:45:43 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id do21-20020a170906c11500b00a455d78be5bsm7941862ejc.9.2024.04.03.09.45.42
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 09:45:42 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a4e61accceaso10297566b.2
        for <oe-lkp@lists.linux.dev>; Wed, 03 Apr 2024 09:45:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdoNr7I3OJX47Vc+qkU+9kvfyQPsp1Z0ljrWeR3+nqliL/xjFOU3XiCZWO5G4DDBXRFgD2aVk8/0x2pbm76CCv8tuf9WoJ
X-Received: by 2002:a17:906:57c2:b0:a47:3b6a:a29b with SMTP id
 u2-20020a17090657c200b00a473b6aa29bmr10816968ejr.13.1712162742304; Wed, 03
 Apr 2024 09:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404020901.da75a60f-oliver.sang@intel.com> <20240403122350.GEZg1KVvsyc-Z3bwro@fat_crate.local>
In-Reply-To: <20240403122350.GEZg1KVvsyc-Z3bwro@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Apr 2024 09:45:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj+Q_LXV0Y5+kBvv-5sTxT3Y7E=8wJ2sX4vzWksd3LWzA@mail.gmail.com>
Message-ID: <CAHk-=wj+Q_LXV0Y5+kBvv-5sTxT3Y7E=8wJ2sX4vzWksd3LWzA@mail.gmail.com>
Subject: Re: [PATCH] x86/retpoline: Fix a missing return thunk warning (was:
 Re: [linus:master] [x86/bugs] 4535e1a417: WARNING:at_arch/x86/kernel/alternative.c:#apply_returns)
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 05:24, Borislav Petkov <bp@alien8.de> wrote:
>
> Subject: [PATCH] x86/retpoline: Fix a missing return thunk warning

Thanks, applied directly,

                Linus
