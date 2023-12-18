Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057F31A71B
	for <oe-lkp@lists.linux.dev>; Mon, 18 Dec 2023 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FImIBINd"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-77f2dc3a9bcso253398285a.3
        for <oe-lkp@lists.linux.dev>; Mon, 18 Dec 2023 03:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702897792; x=1703502592; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yiojd4SBcMhHrNmjERTNQuT1aebGXyUEEkgPXNcRTYQ=;
        b=FImIBINdJPUofSPedoeXUoAuQVpif3ILQj76UMibum3PASG29Yx4/VDc03JXXnxYsr
         JrIkLjA3mgBx+FkKHwicEScgQY5LFLNrgj17fkj/uoOXsO/RnmlLE2EOnb6l0wvJPwtN
         D2FznUxCjjR4Us2GgdlIQIkHb6qfaCc96Jr2L9rH/h2d7Hd8i/DC6iV9RZYcKvsZmGY7
         v9sGspcon9aRaL6r2wqjb7UhcgT/zxvXyIuuEDhR1Fnnc7FZCeZWgTpxlbOWrDfdHzGC
         ZXyea8VnrIaGx5+wH8cvFbxTj2XDQP4M1Q1+fQ8+sh+/BR5SwHbgTwIE+EJ+jW2R0D1n
         iRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897792; x=1703502592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yiojd4SBcMhHrNmjERTNQuT1aebGXyUEEkgPXNcRTYQ=;
        b=WHoCviLsUemw6I2MT4qDnX7bIpvzEMIVOOy9OwTb+etgYcoBlriE/0g8vPZLSVw6ie
         x4gJphg2YzQBSTJEo1/tPmBsFYfcQWe/l/WlJg3GVopD6/7UWcBvv3ykQ8FsCdRGDx2K
         Mb47nLub1FygBAnqCXYy+dBVkz0TYSOKqGzk6kyVmtDGtLgtXI08398g8TUng9iPXdVU
         2wjrMlKdEPgXGXQaZlHhEp5y4GB5A1z5//T6aTLktw4l7bIgrrkRP4sPVqlPwjfiuAGc
         xJWD0WgCWzNC1OB4qnU61PnC+WR7BaLke/Y4Y55CAKtMjSeuRL2NS8SLukigbXXGVHnl
         YUoA==
X-Gm-Message-State: AOJu0YyxdcZRyYMr0HuW1wCBXeXNdkrtPMDNM73g93VlVc9eI4NeVYmV
	iLmZdFMPtrFzFYJFfBCajY1ynPvPu0sSfwLsp32k2+nDujU=
X-Google-Smtp-Source: AGHT+IEyIBWtEFlZ6TtVJDjRXAIBl6g3ztrKUX5AeVkd3RH1MlQmT8jlaOcyykJao+72XQFOe/osqOlnM3YQMvbnjGA=
X-Received: by 2002:a05:6214:2409:b0:67f:27bc:d562 with SMTP id
 fv9-20020a056214240900b0067f27bcd562mr6188400qvb.16.1702897791905; Mon, 18
 Dec 2023 03:09:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312181550.3fa030a7-oliver.sang@intel.com>
In-Reply-To: <202312181550.3fa030a7-oliver.sang@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 18 Dec 2023 13:09:40 +0200
Message-ID: <CAOQ4uxizaaC1RjBYTqPkPJcXj66+-8UVqQR9ArGp40+0FZR8Mg@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fs] 753d63fa0e: phoronix-test-suite.iozone.1MB.2GB.WritePerformance.mb_s
 -95.7% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 10:17=E2=80=AFAM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a -95.7% regression of phoronix-test-suite.iozo=
ne.1MB.2GB.WritePerformance.mb_s on:
>
>
> commit: 753d63fa0e79bb7ad14f0351b800f856b5364ec3 ("fs: add srcu variants =
for mnt_{want,drop}_write() helpers")
> https://github.com/amir73il/linux sb_write_barrier

This commit had a bug in overlayfs.
Does the test setup use overlayfs?
Pushed fix to branch sb_write_barrier.
Can you please re-test this branch:

* c89fa4b25ff7 - (sb_write_barrier) fanotify: introduce FAN_MARK_SYNC flag
* 0fed804d8eeb - fanotify: activate sb write barriers for pre-modify
event watchers
* e464fb4d26e7 - fs: hold s_write_srcu for pre-modify permission
events on aio write
* 5dc0c9b3e65b - fs: hold s_write_srcu for pre-modify permission events on =
write
* 0651230c4b05 - fs: add srcu variants for mnt_{want,drop}_write() helpers
* 03da7318eb21 - fs: add srcu variants for mnt_{want,drop}_write() helpers
* 69e1ebcf925c - fs: implement 'vfs write barriers'

Thanks,
Amir.
