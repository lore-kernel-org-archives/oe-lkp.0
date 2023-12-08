Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DFB3C68F
	for <oe-lkp@lists.linux.dev>; Fri,  8 Dec 2023 18:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeNM1gKm"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-58d08497aa1so1200196eaf.0
        for <oe-lkp@lists.linux.dev>; Fri, 08 Dec 2023 10:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702058860; x=1702663660; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C77TpInB1zh8d1IAOUInQ6yFu0SRsNtsyD+hY95J9tA=;
        b=jeNM1gKms3P0+jA27ZxJA3WWQ8isWUGr90feO9kplK6l1IrgIX0h7mnvlWSTmGZmqz
         NOgilcp4FYUpEnGOCZOD3uR1MWNMZllNW57Zm5lXmiXKJzm/z/Kece0ziSCZ+63TS7mu
         MOnZZVD6d0jX99fkQL6zswEsEDeXcIxUCFsk4q/hK3juIsC0DB5ciCxIbSjaT8hepyn3
         jZQ5T/N0FZ5+CNeEaPNWFqjuv+hCndOJJ1z2JM9ynQ+PDpKdAeG6+C7OnAllSzgVqcaA
         FBno5Ts683UyLQsHWrYsM0guD1RtvVk7ZF0y4TrCl2Xyiczv2iUFT3dp/524xPf4ZDvg
         fwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702058860; x=1702663660;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C77TpInB1zh8d1IAOUInQ6yFu0SRsNtsyD+hY95J9tA=;
        b=w2iS3/Qyuh9ff5yNYIngDfmmhL7Q1wBifvy6Wm/RFzXAX1N1L+B74UHy2XElKG4HYM
         xAUUHgGHSPCBlS5JRIAFddjOHKSo+mfJYTKMMNhpE9wpqRPeAWE3X1FWNxRJKWEzRtZc
         T1DFhDXvbCJzrUDvrZu6GoajblQV2gwOPB3jpM+Cm1hCvVGGfGZARNT1Jb/lYzLv4gi2
         RU+F5ctN+TcLxd1vnPS7pyvj/lbJynVJiH5YLnyn1/dMTp5u05AM+plyHPgVcGS9wg9d
         qH96yofWNRMchreafG7zCoH5ApA6gNifw//HO1bzCemkkLSDSXZJfwsvtZK/Mgn6sBq1
         XVKg==
X-Gm-Message-State: AOJu0YwSb+Id3JZu2S44ggrN9HiKM4TZcClb6SYH8fJ9nzJablYP70ol
	hMuPbtjixHYMh9kvsTnG2L4Zi6Bv3IBCXKXdq3I=
X-Google-Smtp-Source: AGHT+IFG9Wqckhd8+QJop7BFj37zOIOYAYHFNhLpTmBdHyZL9wutRVFbzd8r3gESFpX+rio/9ui4gOfULAIXNS5mAt0=
X-Received: by 2002:a4a:9882:0:b0:590:a673:8016 with SMTP id
 a2-20020a4a9882000000b00590a6738016mr184730ooj.18.1702058859753; Fri, 08 Dec
 2023 10:07:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ac9:7f0d:0:b0:506:9554:eef4 with HTTP; Fri, 8 Dec 2023
 10:07:39 -0800 (PST)
In-Reply-To: <ZXEuBnX4FTDdaqn0@xsang-OptiPlex-9020>
References: <20231204195321.GA1674809@ZenIV> <ZW/fDxjXbU9CU0uz@xsang-OptiPlex-9020>
 <20231206054946.GM1674809@ZenIV> <ZXCLgJLy2b5LvfvS@xsang-OptiPlex-9020>
 <20231206161509.GN1674809@ZenIV> <20231206163010.445vjwmfwwvv65su@f>
 <CAGudoHF-eXYYYStBWEGzgP8RGXG2+ER4ogdtndkgLWSaboQQwA@mail.gmail.com>
 <20231206170958.GP1674809@ZenIV> <CAGudoHErh41OB6JDWHd2Mxzh5rFOGrV6PKC7Xh8JvTn0ws3L_A@mail.gmail.com>
 <CAGudoHGgqH=2mb52T4ZMx9bWtyMm7hV9wPvh+7JbtBq0x4ymYA@mail.gmail.com> <ZXEuBnX4FTDdaqn0@xsang-OptiPlex-9020>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 8 Dec 2023 19:07:39 +0100
Message-ID: <CAGudoHFReHsRviEMBwc2uSMkd72bB1b5RsWfBbEvY6HHSDSSuA@mail.gmail.com>
Subject: Re: [viro-vfs:work.dcache2] [__dentry_kill()] 1b738f196e:
 stress-ng.sysinfo.ops_per_sec -27.2% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	linux-doc@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On 12/7/23, Oliver Sang <oliver.sang@intel.com> wrote:
> hi, Mateusz Guzik,
>
> On Wed, Dec 06, 2023 at 07:30:36PM +0100, Mateusz Guzik wrote:
>> Can I get instructions how to reproduce the unixbench regression?
>
> I uploaded the reproducer for unixbench in
> https://download.01.org/0day-ci/archive/20231207/202312070941.6190a04c-oliver.sang@intel.com
>
> as in
> https://download.01.org/0day-ci/archive/20231207/202312070941.6190a04c-oliver.sang@intel.com/reproduce
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in
> this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file for
> lkp run
>         sudo bin/lkp run generated-yaml-file
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>

thanks

Looks like this one will require a box with 64 or more cores to run
on, so my usual test jig is not going to do it. I'll sort it out in
few days.

-- 
Mateusz Guzik <mjguzik gmail.com>
