Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F21C3F9DB
	for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 17:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551010; cv=none; b=Ap07Hh4MwQZ0d6JH8XSlLz+xMAfkU+v4G11sNSPAFsSudZ2z2cQnZmS89vGMpApsxYMG4Y/YiFGAF9Paq3rnUD7NqwWpQRe9F9qvgJ8mmi6LLpdInj5/S5OIPgky367iFWBBkM1BXidHmK9GACfe5bkn0+62AGYGMkdObOYlDrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551010; c=relaxed/simple;
	bh=tS4YyJziMo9kpVlp+pJ1MlqRkete9IXfSfz8JHxqHTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SH626DdUb6bkFhVDJCMME8ttxjIEXq2zfwk47KfiX/b0W10hfCeys198t3TKMJjqJ5OdWDnMn0FGdPiCe8Z9VwpBR5gvZ8L65Jr064Tep9pAWP6GyNDkKN9k1lXRWQL7bhibmlG5e3Y4QvP8vbW6sRv9gHnadi+mR1P+biDkALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Zb59mfNN; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Zb59mfNN"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3566c0309fso215818866b.1
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 09:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706551007; x=1707155807; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eM8zR6VYCF0hOlY4Lnp7mb0cO2V2uGCLbKBvIv9aWnU=;
        b=Zb59mfNNtcvOaobWpCTKazzvldqJ7Xpu7JFzWf+QP2bU7DAYKAEpwFaxJLe/4Q2dPk
         F0McIsrIGDUYdFHIC/8ump8IE5XQ54TRThKlrAejHl9H5DSs4oeSi8s0oqyzRu4j5HhW
         PKvEwZjKAgCJh8T198V1C2TynOY5hTsJuYcEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551007; x=1707155807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eM8zR6VYCF0hOlY4Lnp7mb0cO2V2uGCLbKBvIv9aWnU=;
        b=jc8QXB+dezF3BS5deiTq0KVSbPn43f9FqdRl2uguxUtIcdSHkGmi60nwZFyfv97pfC
         L9WFWVqv6WBChOd2nvAxeX/Ay4ZpE12zKUcABf3X5eypaw/124GdNlDYZv5mopozaQaH
         QgwBrbvoxwOw9mjH2cMz9IDWfO3tgxxxwyP4cfGjpbU4HizbzjoEq4pg69kgjK/b9HxV
         wTifEleQjkzOWFHL95ip3Lv1O/YV+do7wSPwRpXPhIEmKNAlp6cPoox7PT+h3DtBbu/c
         5z0s9IQqKrdSjQiTQxnzGqOvEKyCj/ToxNr+s6Iq7TrCwNo97EZozLIGqwNqp3bmwPIj
         Jgsg==
X-Gm-Message-State: AOJu0YxsDrhVXpHnUzzvPe2Fc57jXIba95liiWrpnY0MUuKTWArcCD2Q
	hUBEcGeByXCLutT1nOdijMuR07AovQJTGDpjD3FK24qM5w1hy2GGo5j2HpP8V3Wd6xVRfNZyaNb
	WImec8w==
X-Google-Smtp-Source: AGHT+IHd+u2bx0KAnHHuvtk95hb1Ib8k0jqbQfB0dorKLw5QU/zV/yOORnwjT8n2phIWoqOxJE276A==
X-Received: by 2002:a17:907:1048:b0:a30:fb95:9387 with SMTP id oy8-20020a170907104800b00a30fb959387mr5438644ejb.75.1706551007421;
        Mon, 29 Jan 2024 09:56:47 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id vb7-20020a170907d04700b00a34d0a865ecsm4077793ejc.163.2024.01.29.09.56.46
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 09:56:46 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55f13b682d4so1340030a12.1
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 09:56:46 -0800 (PST)
X-Received: by 2002:aa7:d811:0:b0:55e:ebe5:f65a with SMTP id
 v17-20020aa7d811000000b0055eebe5f65amr3047956edq.7.1706551006540; Mon, 29 Jan
 2024 09:56:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com> <CAHk-=wh0M=e8R=ZXxa4vesLTtvGmYWJ-w1VmXxW5Mva=Nimk4Q@mail.gmail.com>
 <20240129120125.605e97af@gandalf.local.home> <CAHk-=wghx8Abyx_jcSrCDuNj96SuWS0NvNMhfU8VjFGg9bgm_g@mail.gmail.com>
 <20240129124436.4b7d0129@gandalf.local.home>
In-Reply-To: <20240129124436.4b7d0129@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jan 2024 09:56:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiPMDeav5B1es50j+fZSK3wxGUc0cWca0obZGR-abrJbQ@mail.gmail.com>
Message-ID: <CAHk-=wiPMDeav5B1es50j+fZSK3wxGUc0cWca0obZGR-abrJbQ@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 09:44, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Mon, 29 Jan 2024 09:40:06 -0800
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> > Now, I do agree that your locking is strange, and that should be fixed
> > *too*, but I think the above is the "right" fix for this particular
> > issue.
>
> Would you be OK if I did both as a "fix"?

See my crossed email - not dropping the mutex *is* actually a fix for
another piece of data.

          Linus
