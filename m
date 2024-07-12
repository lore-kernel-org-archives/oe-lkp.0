Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82900172BC2
	for <oe-lkp@lists.linux.dev>; Fri, 12 Jul 2024 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794878; cv=none; b=QWnqhJupPoHUOYf9YrSfuGNm7djCCPPwdDjDiKHQcAOJue1PigodJhiUKv6AQBlMKv5LVyAw3kQ7820cHSXLmKdHDRhiavXGi2hNNGXrhyKSkOy6O+J/VjCFEzF0bXJK8rESpoRqaTcUSMH4EjR4JmGQXV2KJH5CW7C77kms2Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794878; c=relaxed/simple;
	bh=mPhd+o1U1kAME704nMD2CUOzcHOAVWFOS3wITXA+TXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQp+D5tEGDfGPRkSDstl9kOT/LaNgBnApS+CcGN7XaFNIMZLeA09lC1Werq0mrMNCcsN+W9DMZAyO2e23Syo5n4YiuOnmjIxnJs6WcQWYXBiTtjLfRAmlFPIRIDh78Jklls5KUle5eCAo+mnKf6pfJr2njL7dcirsjjcHwtkU94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpZokWuY; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpZokWuY"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2c98660fc91so1585790a91.1
        for <oe-lkp@lists.linux.dev>; Fri, 12 Jul 2024 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720794877; x=1721399677; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPhd+o1U1kAME704nMD2CUOzcHOAVWFOS3wITXA+TXM=;
        b=fpZokWuY6kA8sdQobHoE7OnyK/+8T3T6/gYOM6poMc9PvFNKqLYRb0q0eleI5cu4i4
         Z0w7nTfYmNe5F8tBX0Usv6R5cSuWH93Y6Z6bMcGtbpk8SBUUILLIUtTkPuAGlyakNc3g
         Z+OBQ0BBSxpJL0ol6M2M9v+DsrjZBEwFfwOsc+RBzXFIZtOjJfdYoiWrQYXxFkZjf5e5
         cJPA6cR5oGz4ZYZXSKOyP915fbDnJw8aGOuF0+uZQulLH+t2eCF5fp6RxVbsJ3zH7t1G
         DHHNRPB2KEcLQmpmR8/rOv6qS7DLxyHEDlfnSVj8rneN5aNHArQJtNbalPyG8PURifG7
         9jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720794877; x=1721399677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPhd+o1U1kAME704nMD2CUOzcHOAVWFOS3wITXA+TXM=;
        b=ANtm2Zc5NSOp9NpZuTL8Ry3Yx6tCyAPWbuZyK106sFroLmAqKpb2ZTC69HtzHOlY7Z
         dHLnLZJ3IeL57b8BZJZzj3V/HVuwfnGha4ElPR/oT9zZG8O0+5KvEcYBwd4AM3JI6A58
         /Hw/A6lKkwrnfx5HMb/6TWn/1kHYZcyTycWO8hYAPZFtBDxGy1QwB95yPl+4kaMAs2JX
         tBgXxABhqILM38X0xsUQlMGWTQ/6O5+r4DAy2B3uhoPru0Uwv1rlzjT5sTLLzSqJlUab
         NPEUmWXEoqdtJ8w7/NS5c7OYOWuYfHza1B/0UHhoDrBIQw7Y4/qNNMTi0Z+4/sohfuLm
         h/DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb0uZQ726l2ibyMNupUmUbmxUTvjlVxxLnWMVZTbezw1ldOOya/lBAKQVtWzcrxIIpwGL3U9AmLvFuUJDItHZXG868H2EX
X-Gm-Message-State: AOJu0Yztt6vf4DEl2eKGBRgiqYhfAysbTT0T5N32ebCYxqmdTjILAO2U
	ejGP+4/uoNBe9h4pjcLoHJTT/RNK5XfGciBKJMwH/zqICGz4czl2XMOeB0n9ZV2QIJrAQXgAt1j
	FIZlsBhA7cezFITk/50ihTDJh2xo=
X-Google-Smtp-Source: AGHT+IEG2WBgGKXxbJXI5EV6T79It5f1jAUqW45nNRq6S653bJcKscHw4TA4fVKdARkVDtVaH+QuG6D+gUDLzJCB3io=
X-Received: by 2002:a17:90b:23d6:b0:2c7:ba6c:c3a9 with SMTP id
 98e67ed59e1d1-2ca35c28b11mr8564206a91.12.1720794876729; Fri, 12 Jul 2024
 07:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407121521.4ff1afdd-oliver.sang@intel.com>
In-Reply-To: <202407121521.4ff1afdd-oliver.sang@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 12 Jul 2024 16:34:24 +0200
Message-ID: <CANiq72krwbfa8EZ82bAYh=1frosZCXhR5VM_=3JDUJggTuQ5KA@mail.gmail.com>
Subject: Re: [rust:pr/1087] [rust] 6571afed2e: BUG:kernel_failed_in_early-boot_stage,last_printk:Booting_the_kernel(entry_offset:#)
To: kernel test robot <oliver.sang@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 9:49=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
> https://github.com/Rust-for-Linux/linux pr/1087

Is this a new feature where you test PRs of repositories now too?

We don't currently use PRs much (we use them for showing
previews/drafts sometimes here and there), but I like the feature :)

Though I would imagine PR authors should be Cc'd (I think you may be
able to get an email from the GitHub API or just from the Git commit
author).

I hope that helps!

Cheers,
Miguel
