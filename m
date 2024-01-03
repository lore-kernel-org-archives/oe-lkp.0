Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5629118623
	for <oe-lkp@lists.linux.dev>; Wed,  3 Jan 2024 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrsCWgRm"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-28cc07d8876so1086159a91.1
        for <oe-lkp@lists.linux.dev>; Wed, 03 Jan 2024 01:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704272506; x=1704877306; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGznX7WYH4v+IstE717/QjOXmBKiMPgM0a6SaDcyCWk=;
        b=NrsCWgRmdToK/Mp32GjA98tQ/mUp+ZhbxTC/b5VIukJ1R4esoMWOk5foww3dzbXx/R
         Kj9w0v6OJWU86lpq0J2sfn5uYeISrEZXSyIlx0I8TgjCE5CfZ8QuOYHGoyaiHk1dAfcd
         hjfP69H+wq+ZK1mbeoMfcT4IqsyugMTJgvG6xi4CEB4YSeelUydeM28LQsR8OBpFoOsA
         sA/NJDU5FXjO4EPI0kDxvZXVMC0QenICDFuqIDQNewDut3F/dycDVT9yN6P3xF9tvxNE
         CaiuHrvVp27pOkVRINOSHbhlQS35gk+CvWjjUungJKDl0icixVNwHvPZF58MSiP8FlX2
         pK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704272506; x=1704877306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGznX7WYH4v+IstE717/QjOXmBKiMPgM0a6SaDcyCWk=;
        b=T7I6Tv6bsHoAvluVMUqo7aCGSrf5otR+1TAgO4f5CvGX4fue+pBxr2Hf3wVcNYdJY3
         VCqgq2DrCtLqyse4rX5iRQ9yDQeNIkOiBEfPvvt94FF8d6Me0eFcZfQIAHzlBvbZ2/PI
         pFcpge8wRwAL+1MW9Fp/OCwmjoTb9Uw+Rhlpe5XY7fJv/cuWExJAkukDifsLDsxYt4/J
         oWbCy9d6O3UPuojexDWBOqCeWVvmeuHCARc/lT4VkGdfph131pdhoyqaF1yPTGtg+jIE
         9Tl3ZxT45m7Np0mMZmU+J2VgAcmbgC4LPu/8OOkXaVTIsw6eFJiyoXtRZiPGNLVf+8fw
         BLVg==
X-Gm-Message-State: AOJu0YymJcgGv5e9FTRx+nA33EgVdo3Tu0V9u7YKwzTLuvKlch/+F/0P
	3veX5PYFNmCP9GmoyX5HowCs6L/9/rnqneO1Sjw=
X-Google-Smtp-Source: AGHT+IG/TkHGlE+KCz5Q/N6IXzIbXU6XAISaGjcot6U+D8okXS9K4oQuxa4lymqzb7V2xEeJ8eDWoMsZYJCoNthYcao=
X-Received: by 2002:a17:90b:1192:b0:28b:92da:a028 with SMTP id
 gk18-20020a17090b119200b0028b92daa028mr6639721pjb.60.1704272505529; Wed, 03
 Jan 2024 01:01:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231227145143.2399-3-jiangshanlai@gmail.com> <202401031025.95761451-oliver.sang@intel.com>
In-Reply-To: <202401031025.95761451-oliver.sang@intel.com>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Wed, 3 Jan 2024 17:01:33 +0800
Message-ID: <CAJhGHyAsg+AOY4GEE4m-7YA7YPf0hzqMgWTAVsr31Ob49VVXyw@mail.gmail.com>
Subject: Re: [PATCH 2/7] workqueue: Share the same PWQ for the CPUs of a pod
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Naohiro.Aota@wdc.com, 
	Lai Jiangshan <jiangshan.ljs@antgroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 3, 2024 at 10:55=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:


Hello 0-DAY CI Kernel Test Team

> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202401031025.95761451-oliver.san=
g@intel.com
>
>
> [   30.471685][    T1] ------------[ cut here ]------------
> [ 30.476998][ T1] WARNING: CPU: 111 PID: 1 at kernel/workqueue.c:4842 des=
troy_workqueue (kernel/workqueue.c:4842 (discriminator 1))

It hits the check here

        if ((pwq !=3D pwq->wq->dfl_pwq) && (pwq->refcnt > 1))
                return true;

Not only is the default pwq installed multiple times, but also other pwqs
with this patch.

Maybe pwq->installed_refcnt needs to be introduced to fix it.

Thanks
Lai
