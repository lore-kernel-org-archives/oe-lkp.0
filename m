Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D71E1292FA
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706716067; cv=none; b=ImEvf8xRU4gI1z8nszZxo0Yyqx0QB5Zhht0/zj8neRl9bguKYKdyhaxX2ZPyaWxI7XwtCW0MCUbXH8k2M3u0D2JCI4pLPRYphkmrxODYqtBlwS0qjj9uVUIXz4ARlSDTk2nFiU/AP1qiuTjSIgpRWOgUbw7lmInnV9sAHwQw210=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706716067; c=relaxed/simple;
	bh=kcvtLaH8tgDWu8daM4FrjIXLhnfcpyDWdLSIcNR9BMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YmsRFeKA2DwL/LOJ89nDPbRj1Gdxr9nBhSrS+iH6/l90Aw4e9hZo+em7BpsjyNX35t1nvOJQjNmUYROooGpembhe1auxOG9+W6vmopp3kjg4fq0t8TT7TdddQempoNPz9fl5epAvHY+E6CJWXjkk/hDBusoNbixjE0JWA7hwhP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEjSbB7o; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEjSbB7o"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-680b1335af6so9217406d6.1
        for <oe-lkp@lists.linux.dev>; Wed, 31 Jan 2024 07:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706716065; x=1707320865; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcvtLaH8tgDWu8daM4FrjIXLhnfcpyDWdLSIcNR9BMI=;
        b=OEjSbB7oS43zYQjwTpTepiTbRX4mwOq/TVxK8KH0eTsdroPmVLe9Tv/MRiQYzcYop4
         wJSMV1IgsROjQjFCDmi9gM+Nws7bi/GpYTMq2VlMxF+Q6eGVA4A07fFcUOE2tNUP0dfA
         TNY+BuIJMnoYv57sd3JoQ+GzCuits5tFtoMVGAiLJAAm25MyvEMcyJlPKy0qex8lLf6+
         lwg8t5Qf02Kbp+wcvTydPjyzR4kc9F2bm7OD43vA0iJwNmwXpSCU6QER76Ci/siQdsIv
         k94KaqDHYOMBeRFp5SB29evJ/sAD/qgq6xuam+KbPDQ3XkmAfQ9FBFo9P2P70KeZFb3Q
         eJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706716065; x=1707320865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcvtLaH8tgDWu8daM4FrjIXLhnfcpyDWdLSIcNR9BMI=;
        b=VMjqb6MhK20a0eaA7gSIZP0WnJ6W1lBy10Z+AZfxh2Kc3myTsEN5emjlYQC509xUAC
         Ds8OviZttobj1m6SBmcES5lLpNLJ0IVM0vw/wC6PkR2ho8Y0SoHSJ2oS6uERoSD+Bspf
         G3myUvk78xCbiF4uhkxrmZDAZngQMiJ0vqFEzt37nBhZT8bqyoyeqk2iELWWzaJ08Adx
         HoOn8f2pQ2ncprF7gCJWrc3q2HfEVrCMfcS1lytSmQS24EhEeufzGGHulY+uw8Iv1INE
         hWJ9dlKJeikSXWyAt251NnDYHmuYu8cgNNd27KA8UtGsqUkJ8ifMqiO+C3/MOGWjzJ8Q
         1+Ow==
X-Gm-Message-State: AOJu0YylZzV2vN85+tnKbhb3iCAOUpE3dmjOlCeJtHNkBhqbY2cuj2V/
	mET/lI1oSOry48k4KvNQDaahoT1/HGPxB82pDoWL8SUnUQPfVdSNfVwJkzTo5XMSQn19dMgmgK7
	8N4z8j8wuCiGgVA7cmQ2ox6G2cDc=
X-Google-Smtp-Source: AGHT+IHQqAgRfXqPSmq7iWifa1xzg0IGtYsDAfOxUUbc14RP6DBVnAdj5gYQaGlZTXyn6lwVnaxg1nJlxJqTr4b244A=
X-Received: by 2002:a05:6214:226e:b0:682:bfd0:d79e with SMTP id
 gs14-20020a056214226e00b00682bfd0d79emr2330095qvb.27.1706716064959; Wed, 31
 Jan 2024 07:47:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401312229.eddeb9a6-oliver.sang@intel.com>
In-Reply-To: <202401312229.eddeb9a6-oliver.sang@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 31 Jan 2024 17:47:33 +0200
Message-ID: <CAOQ4uxiwCGxBBbz3Edsu-aeJbNzh5b-+gvTHwtBFnCvbto2v-g@mail.gmail.com>
Subject: Re: [linus:master] [remap_range] dfad37051a: stress-ng.file-ioctl.ops_per_sec
 -11.2% regression
To: kenel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 4:13=E2=80=AFPM kenel test robot <oliver.sang@intel=
.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a -11.2% regression of stress-ng.file-ioctl.ops=
_per_sec on:
>
>
> commit: dfad37051ade6ac0d404ef4913f3bd01954ee51c ("remap_range: move perm=
ission hooks out of do_clone_file_range()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>

Can you please try this fix:

 7d4213664bda remap_range: move sanity checks out of do_clone_file_range()

from:

https://github.com/amir73il/linux ovl-fixes

Thanks,
Amir.
