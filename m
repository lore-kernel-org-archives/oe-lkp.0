Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1662417F7
	for <oe-lkp@lists.linux.dev>; Fri,  7 Feb 2025 11:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928058; cv=none; b=eE/H2cSr9JNID5l9Otr0BjHgta6+V7CJC3cbLjRzUhH8scxRJs4CIAidp9UxSqFGcrCUPM0q7Yl4ceGgRb8SLCAcq/CzoyyehNICt6LwM91+9WEA72kVUCBWXHg7quvI3M6+egvaoM2ApNEHrcea8fYWIFTHEpurMOOcq0mmZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928058; c=relaxed/simple;
	bh=1wh2cpQUxPLEuY0IQg/F5m/jGKR7k88MMsXZiFFmCBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ry2byU886Xpav6S7AKH25ohHPuh4YHZjqMxfSXtdiW0fxCo9vGayjrjLv18188GVG1ff8w6WAQZNX/9ceSYt33/fFTq+ezBegMFs175A96x9nrZHxfu7KYEcrEjAgFrzFMnpXYlmU1d6qysoCzp2NHHUcVzeVCn13fyBeTwlEeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9W495qz; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9W495qz"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dce3c28889so4279598a12.0
        for <oe-lkp@lists.linux.dev>; Fri, 07 Feb 2025 03:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738928055; x=1739532855; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wh2cpQUxPLEuY0IQg/F5m/jGKR7k88MMsXZiFFmCBM=;
        b=M9W495qzx7TZu9wIbsfLV0uWzzy73hUpizxAy8Uw1Fi3vvrYrHp5s9JfCNHUyz4O+n
         w9X9Aw9L/yXXKftgSmDx3RUvFIVve0fP5JM48uyj6Vac4XiAfJvqTo/y8Acaldciuhmj
         vNGQsnnd+D6Oaq9AmKQbfh1C+4ViNYIfs0k9jsMSi8sNlASUCPTUrzzhFJe3vIQ4ulni
         JbF7y8mVsM2HMePqGEVlMFr2AmaSo7kbkLX0Z0WfEOgw4tN27lAYzMcMD8aZkjwXgtdP
         rOMN1BnGYRE3F8Pb1Fqsg1xQ+BAyByvGnbubsOMWBiofhtrU6UDI0B1I8XXtbs37eW9A
         ptvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738928055; x=1739532855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wh2cpQUxPLEuY0IQg/F5m/jGKR7k88MMsXZiFFmCBM=;
        b=c5eaJbbK95B++W8PJU68vEe8Ztrd1j6F3733XA+aqE5oXcU3rvGrlINBKPwgu52UOR
         C5+QLf/yZbSgbTC1g3MAj4KdSXokQx3TWAKiUSm8iTVI5u0RyopnvCIBm8lo1/1YCcvE
         DyzhgJVD2/Nfl55+rfxagrKDOCPXXFmL10vSRk4UnHX1c8TiYdOQqHRvYA5vw0OGxTsJ
         FK63lLNbUX8hT+gnuHyM4UL6ql8Ja+ABHEK62EJT3rsdpje41gCtVPEVMUk3Qu3N6b5G
         BulUr92b/6WW5CFgW782WB8nRNT6loug8YJxvXnemV0OgBT7vYEFm5q9cE+KV9sEW1TU
         Rofw==
X-Forwarded-Encrypted: i=1; AJvYcCVP/KFwb6d64zfX/y8pjd7uN2KXIm0nT2aNzd5cVu3t19JUquWDHHeyletiHmY7Hp6FCXGCxr4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzO/+LOrZ7v7GDkOx8jAN/wXtU92dd+ky9jMijjEQXKh0WHxWT0
	EASNGre/ma3stJFuWuuBkEKAckcr95O4jWQi4keUeXyMcBXrwlVDnYlPZTVtAegBswTSniVUtaQ
	t2f4BRzr/Dqv0t3cEiWoYwARQbgQ=
X-Gm-Gg: ASbGncuAkZqW1wShFPmkOWzymglTpBLdxLiULRLLmnS+eOpOn4EqDhIj/nXh4QxQ1U9
	XUa59d4JodsSyP0svQ9BUT2MdugO8WgN7URb1dcUNxBwLhFKirzPUDl17yebDBOcXILuUQlv3
X-Google-Smtp-Source: AGHT+IHyRv3J+H1efaMv2+jprVJQ5kvQHBMSEBpkJMRhuptG38yMhxproOUF8W1NeehsICmuMFItcl1nZXdLw/P/+DA=
X-Received: by 2002:a05:6402:2189:b0:5dc:7fbe:72f2 with SMTP id
 4fb4d7f45d1cf-5de44fea964mr3336334a12.3.1738928054659; Fri, 07 Feb 2025
 03:34:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502051546.fca7cd-lkp@intel.com> <CAHk-=whSncSTE_Q0as-d989L_niJ6=ViwaDoOK6gTcWHNPkp7w@mail.gmail.com>
In-Reply-To: <CAHk-=whSncSTE_Q0as-d989L_niJ6=ViwaDoOK6gTcWHNPkp7w@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 7 Feb 2025 12:34:03 +0100
X-Gm-Features: AWEUYZlfBZ7ZGHwIFt2AGR4hspLGRP5IPR0R2ajHRmpRBd1zmnHtetwWqx-EEJU
Message-ID: <CAOQ4uxgC_Uaa2XA8vyuDvsio1ysr__9kF6RK3pKcD=Xa1ps8Mg@mail.gmail.com>
Subject: Re: [linus:master] [fsnotify] a94204f4d4: stress-ng.timerfd.ops_per_sec
 7.0% improvement
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 9:45=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 5 Feb 2025 at 00:09, kernel test robot <oliver.sang@intel.com> wr=
ote:
> >
> > kernel test robot noticed a 7.0% improvement of stress-ng.timerfd.ops_p=
er_sec on:
>
> I have no idea what the heck that benchmark does, but I am happy to
> see that this whole patch series did actually end up improving on the
> whole fsnotify cost that I was ranting about in the original
> submission.
>
> Obviously this load doesn't actually do the new pre-event hooks, so it
> seems to be all just about how fsnotify_file_area_perm() (or some
> other fsnotify hook in the normal read() path) now isn't the
> unconditional pig that it used to be.

Right.
We got this win by slightly modifying semantics of FAN_ACCESS_PERM
events, but I cannot imagine that anyone will care (famous last words).

It's all about the fact that
>
> I don't see how that would be worth 7%, but I'll happily take it.
>

Yeh, I was happy to see that as well :)

Thanks,
Amir.
