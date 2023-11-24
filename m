Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBC1394
	for <oe-lkp@lists.linux.dev>; Fri, 24 Nov 2023 00:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDEMbZOi"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-54917ef6c05so1893404a12.1
        for <oe-lkp@lists.linux.dev>; Thu, 23 Nov 2023 16:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700787194; x=1701391994; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QS8CVpY2dRIE9/ItXow6oOuaCdUNl5jE9qUR+XAHyUg=;
        b=RDEMbZOiOwzBiM5VLgDlZ5wXrAd5wfBJUDX+v1e1x0DCztCIiz7oNp+DLTKeHusm2W
         Xohiit1KrQI5KFO/WGkrHaDgAoFgxSJ2Ll+OqpSFwIt+gxO/w8W3aCNtycpyjsSID/mG
         Q0q80Pp+bvWg+Y8NxgZl6LUHT9ovFYQEF43fgp0p7VUXL8z+FcFXNOvQlp26x7wZDbxf
         x56VoS34b1r3tuJI77LIko27rFSX9YV69vvjcGbTQxMIIP106MejLfB6xyZNBOL1LKXW
         QAR9u2mZFut1Gd2XwA96OaA6VFDESgdcsYSV//SiT7a5Y3mjG2CbqTJXg0Y8YkqbtbIY
         fIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700787194; x=1701391994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QS8CVpY2dRIE9/ItXow6oOuaCdUNl5jE9qUR+XAHyUg=;
        b=oLdVnY9vIE+udMMLOowGqz2WG+O2TbPlJGEqoDC24zm6v26Lflij225N03WEEE2X/i
         r63WdZhHyWU8JjWm+mvXCQ2NqagLrI2c8PAS2ME26ZJ1MPvyb0Op7dYEToimEJ30VEx9
         0kaYCrxjOLmbacFUiNYENuQ/w1vie/NZ419fQmtvoYPI1dUgcqEq1ApE+p86p/8RZnDf
         R2L4Da0OnHsh5ftwCJ66l0v4OWZyaqW3M5pHYwMIDjJwJW0+oNAXZG3AR8RvFQUbbWM+
         vaxDxUtbj98vGLNKeAAuIOe/FKkhhfyFxn8ekeeN2E5tS08B1yO1tAv3mWDEbMg1RUvx
         tJzQ==
X-Gm-Message-State: AOJu0Yw3fIOszr9TH+/mZHHeXgbu8CJy1vNpTcegWFW5SRcKmditaCJ9
	UgyM2s2wjNJFdADdMZAk09zmNed+SxOf1wLVZFg=
X-Google-Smtp-Source: AGHT+IGzTE1+5yQw2oSsdNswRImIAfvmmX9ZG1e7hUvEAb+IPtk3pOyxZFP19bVMuYBUEsKCVhKt0PWNrXikDt+qgIE=
X-Received: by 2002:a17:906:10d:b0:a03:d8ea:a263 with SMTP id
 13-20020a170906010d00b00a03d8eaa263mr587176eje.16.1700787194247; Thu, 23 Nov
 2023 16:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311231458.61e2502f-oliver.sang@intel.com>
In-Reply-To: <202311231458.61e2502f-oliver.sang@intel.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 24 Nov 2023 01:52:38 +0100
Message-ID: <CAP01T74ibZtsdssLB9WsSxP0SPusaNqfmzsqWz83T2H5TV30SQ@mail.gmail.com>
Subject: Re: [linus:master] [bpf] f18b03faba: stress-ng.seccomp.ops_per_sec
 -2.0% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Nov 2023 at 01:41, kernel test robot <oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a -2.0% regression of stress-ng.seccomp.ops_per_sec on:
>

Interesting. I'll take a look and investigate.
Thanks

>
> [...]
