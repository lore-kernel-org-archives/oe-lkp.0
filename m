Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A914186C
	for <oe-lkp@lists.linux.dev>; Wed,  6 Dec 2023 18:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkibK2ZZ"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1fafbefe710so79620fac.2
        for <oe-lkp@lists.linux.dev>; Wed, 06 Dec 2023 10:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701887437; x=1702492237; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nJAZ/jJ1lCkqUr4OFytX5WnFEtupCNITkqPY5o5pyG0=;
        b=MkibK2ZZub8XNyI3bkP3vP6DslkEnmbdKiWZHmU1aLDm7IF/VV/UrUBG5adtHZ+qiI
         vxW11g2pcofhLaF2rRNEukcp1Ji13Sxian6TaT27GBPwmO28RJnptNh7qIzSUHeBeBjn
         mqvoDSDQXtzHUZ3e58zrSMaJ7OgeNhMIRWbvTmVIhCV+fNam0qj6AnmC6MLS0hNqrHsD
         ADxXEDiSK+xjQSYu6PEN7C0kYEGk9rwDC3fW+cL5GUsDNsYED6SiahkKxgnEs80T/Y0U
         zd3aZ8VpeAJQwiG36FZuaoUpwk0yPPVGrz8A9hkvq4rco7Hv39FDpR3sBXZq7Doh3Ng0
         OiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701887437; x=1702492237;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJAZ/jJ1lCkqUr4OFytX5WnFEtupCNITkqPY5o5pyG0=;
        b=SS2Vn9Yl3ABB60xi304opCizPwT0Sbz+PIgBteG1e11LuLUDskXBK8BcsUKFHUjuY3
         AxKuefBD0WbxjXKKDi6u3SJKzDj6kVK8zkVszTrum7r1lshQf46BN2hKwZCKmIXpVQlc
         epr/H8ZXtynEDApsIE9rzOZQFPfKRjUkW1vcnZ1wqo4tdhcfctQuhVKwk9hAnPd/PAgY
         WXJ+WX93AijwrJOgD05PgTtg1ki6MG9P4LgaNrv7C6QVnYIpLQmMw3F2HJjitKBf0K57
         gff+DBjcYBMXu3RHFAo46FD5mH0Nhphf4ywBag+rbZaI4ymH0Ka1wjj/3UFcBtRd9eop
         QIpg==
X-Gm-Message-State: AOJu0YwcLcMWRNKYSR+/gYksXXn2mxo+H2E6viGPzaU7SWMunKz3Z5zj
	/IZoCbURO+IEm7PyOXMiIVk+/TZtXg05uFHWPso=
X-Google-Smtp-Source: AGHT+IEiTk8lgkH5BrOGSqsNNN3Xksa3/U+y0Fblv8doHn91vsqMwB/Vl2Pn3CTtrOBwyL6MSlrLyzT6K8JFQcv5FeA=
X-Received: by 2002:a05:6870:1b83:b0:1fb:4a6:31dd with SMTP id
 hm3-20020a0568701b8300b001fb04a631ddmr1541051oab.42.1701887436874; Wed, 06
 Dec 2023 10:30:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6802:30f:b0:50c:13ee:b03d with HTTP; Wed, 6 Dec 2023
 10:30:36 -0800 (PST)
In-Reply-To: <CAGudoHErh41OB6JDWHd2Mxzh5rFOGrV6PKC7Xh8JvTn0ws3L_A@mail.gmail.com>
References: <20231201065602.GP38156@ZenIV> <20231201200446.GA1431056@ZenIV>
 <ZW3WKV9ut7aFteKS@xsang-OptiPlex-9020> <20231204195321.GA1674809@ZenIV>
 <ZW/fDxjXbU9CU0uz@xsang-OptiPlex-9020> <20231206054946.GM1674809@ZenIV>
 <ZXCLgJLy2b5LvfvS@xsang-OptiPlex-9020> <20231206161509.GN1674809@ZenIV>
 <20231206163010.445vjwmfwwvv65su@f> <CAGudoHF-eXYYYStBWEGzgP8RGXG2+ER4ogdtndkgLWSaboQQwA@mail.gmail.com>
 <20231206170958.GP1674809@ZenIV> <CAGudoHErh41OB6JDWHd2Mxzh5rFOGrV6PKC7Xh8JvTn0ws3L_A@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 6 Dec 2023 19:30:36 +0100
Message-ID: <CAGudoHGgqH=2mb52T4ZMx9bWtyMm7hV9wPvh+7JbtBq0x4ymYA@mail.gmail.com>
Subject: Re: [viro-vfs:work.dcache2] [__dentry_kill()] 1b738f196e:
 stress-ng.sysinfo.ops_per_sec -27.2% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	linux-doc@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

Can I get instructions how to reproduce the unixbench regression?

I only found them for stressng.

-- 
Mateusz Guzik <mjguzik gmail.com>
