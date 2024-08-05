Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF316BE00
	for <oe-lkp@lists.linux.dev>; Mon,  5 Aug 2024 19:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722887970; cv=none; b=mPa03cg06wrDatOHKVDDJnVtWPUk5Y/yhP4/a5vVFJm7m0HkPev1kGoZEPEFhhHpYOc6MsO/zdDv0s4NKcJ/ug36pNV2HvXQrk2eNgHCMxJyWX0ML23K1ER4BCIjTUUg0y4dMeyCfmWZ9NsqvuFyKltCQ9sn+8npm3g5suUoiuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722887970; c=relaxed/simple;
	bh=RnAVL1F8Zc5pFSyUaXWapLKKpniVvPkLdg4oxhP2wTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/C/JFECERqTpbMkOKZ4o+BpBEvNjf6Ps9YZ++tF1m2glNXdqkXV/rmQDGNxl3uxli5WQWS//3XClcpX7f5rSBNmEbmdw1bSIntJFvK5/6J1XevFKrGtfynKGZx4gZWAOsXvksPpnA48AvQycBpVu0Amy13X785PnsWyBPPk8M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Pnfo4EQ1; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Pnfo4EQ1"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso161963681fa.2
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 12:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722887966; x=1723492766; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LIYPIC0BflVMuV8NaYQS5YL8fh1QrNDyHT/xu/wxw5U=;
        b=Pnfo4EQ1jyTWSeFpU1F82GsbT+3vs38qWUB6XK8vNKrt6EEePY/5ojrMEEXW8CwgoF
         F7fbH4G5k5xbYCVR+SV3+hhT1TdTQAQffyXYrA//haal4pMpXwtJKy9D1V9GN4QWVYB9
         1jouuYkB7A4yi/u1HUQE9d1SYoFtK1Q6Svbww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722887966; x=1723492766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIYPIC0BflVMuV8NaYQS5YL8fh1QrNDyHT/xu/wxw5U=;
        b=MoS0cz9z4FJXJ2JRcLCSjLPYqddGQ3kOQqBjAa91M0VzsANEfjsc3xpYeL9DsBqS7L
         390MaAcVTeio8+y31722v2w+fxrBc4PmkYKePDwsfHwUsHJlCjgvbIJ3J2Ydw5O30+ey
         titOVl0YihrRMH2suQ48VAS+CXFi/Wjfq/Mbx+jbpqhO+tY6FKCGfC6IsR9T6UGV8KD3
         JwDL/XoutO5BRJKJASEnTkPtdTf/tEZcKqNIvdcroLrGjCoxs85g/dZmdJal9zlqdlj/
         mJAcf4ZmGnaATFeBozOF17PJfScfodXVRjpIG2QBfagYEaHn1teISyc76068vvl8C9Oz
         SW9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeN7f3/dHR75jqQXO1DSzsm1HH0r90++RbYh/D1PPrKTl5DiB9sWDML9dTMGXCiMXeH8kVyoGskgA5jK4s/AWagoRP7psB
X-Gm-Message-State: AOJu0YzNcAlGnCWHp5q+6LQIk2Kj7hXAG9DYZQsW78z9a5oO7zzkreBf
	FqHGKCk7TkToOD/WIaf3xU3liUOOe2N6l28mJsTBS1uIJiOc0ijJ3AnGx1Ch4M4/ijEfKGHD8hZ
	aYUXRBg==
X-Google-Smtp-Source: AGHT+IHrfXjECv4s41UP8k4V9D0/nrhTohMZYH4KD3PCMBJmDUqGxXihxv5SGNB+1VtXcX3SiflrMA==
X-Received: by 2002:a2e:3002:0:b0:2ef:2b57:5bf5 with SMTP id 38308e7fff4ca-2f15aac4ddcmr100192701fa.25.1722887965846;
        Mon, 05 Aug 2024 12:59:25 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bb5117ffa0sm2307566a12.41.2024.08.05.12.59.25
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 12:59:25 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428243f928fso72945815e9.0
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 12:59:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6alWq4UnR4C6BEXOO1tADTDFDbMghIXszqXpenfUU70lxIuHphVXiwPGEnruehWvXosqBn8MqsDRIsjD3IXWn/0CyeYmt
X-Received: by 2002:a2e:9845:0:b0:2ef:20ae:d117 with SMTP id
 38308e7fff4ca-2f15aa88cc7mr104885471fa.10.1722887468283; Mon, 05 Aug 2024
 12:51:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408041602.caa0372-oliver.sang@intel.com> <CAHk-=whbxLj0thXPzN9aW4CcX1D2_dntNu+x9-8uBakamBggLA@mail.gmail.com>
 <CAKbZUD3B03Zjex4STW8J_1VJhpsYb=1mnZL2-vSaW-CaZdzLiA@mail.gmail.com>
 <CALmYWFuXVCvAfrcDOCAR72z2_rmnm09QeVVqdhzqjF-fZ9ndUA@mail.gmail.com>
 <CAHk-=wgPHCJ0vZMfEP50VPjSVi-CzL0fhTGXgNLQn=Pp9W0DVA@mail.gmail.com>
 <CALmYWFuCvphvLQOuQHBbFq0G8Ekyze=q45Tt4dATOt-GhO2RGg@mail.gmail.com> <CAHk-=wgySgXXkZtx49Xq70X2CmSizM8siacYKncMmFWRzKjs5Q@mail.gmail.com>
In-Reply-To: <CAHk-=wgySgXXkZtx49Xq70X2CmSizM8siacYKncMmFWRzKjs5Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 5 Aug 2024 12:50:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgP0hCD-05rfvWcVmizzx676WsR0+iEuVwQUMSFFnM8kw@mail.gmail.com>
Message-ID: <CAHk-=wgP0hCD-05rfvWcVmizzx676WsR0+iEuVwQUMSFFnM8kw@mail.gmail.com>
Subject: Re: [linus:master] [mseal] 8be7258aad: stress-ng.pagemove.page_remaps_per_sec
 -4.4% regression
To: Jeff Xu <jeffxu@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Pedro Falcato <pedro.falcato@gmail.com>, 
	kernel test robot <oliver.sang@intel.com>, Jeff Xu <jeffxu@chromium.org>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Dave Hansen <dave.hansen@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Jorge Lucangeli Obes <jorgelo@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, =?UTF-8?Q?Stephen_R=C3=B6ttger?= <sroettger@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Amer Al Shanawany <amer.shanawany@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	linux-api@vger.kernel.org, linux-mm@kvack.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Aug 2024 at 12:48, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But x86 has the same context.vdso logic, and does *not* set the
> pointer before installing the vma, for example. Also does not zero it
> out on munmap(), although it does have the mremap logic.

Oh, and the empty stale arch_unmap() code on the x86 side has never
been about the vdso thing, it was about some horrid MPX notification
that no longer exists.

In case people wonder like I did.

           Linus
