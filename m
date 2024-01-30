Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03026FBEF
	for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 00:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706572907; cv=none; b=DQvS2unqksxBZUEcUzg0D5GZlNSxUYIiK9a3TgWjbTaUvpqOvoYTxo+g3YM2w1wwR0DQZ5CpxBDxjiehgkyUrdrT65KrZF8wqKLNMk/zlEMUtPQJynEBYr599JNWlN5IfwErF0lpaUedFkFzoEX4yTDL6thZHjXMEFOfHZ4VCP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706572907; c=relaxed/simple;
	bh=mP547cxSLBLqbgPFiU7KdWOYk0hFrjdJ8bs+VrkDQz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYyTbGfsrvEbU8wRRzWplY0IMWZ/s06fbvQQJNmp66bqfxvKH7lCFbsmgenybyxcpYwwlNpyQIhsF0wNdjKR0yFFX4A43rB23rNHeKtWGLvhuVMYkxoGXwBKqxGWQefCrdPgyBnreFwJSNne73G5RaKuQixmH59ojnfU6sEeSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=L0BdNYjP; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L0BdNYjP"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5100ed2b33dso5273803e87.0
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 16:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706572903; x=1707177703; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qnCN62biQQqn1jm8DGkvLeUSFirrT4FwO2mAzGrxaTQ=;
        b=L0BdNYjPWkynZRRcUw8P44QDS6GAgR/I02u3trsCtE5JzlulcS06LgGxIXD9ZPaTJH
         1M3pNMQIKMyN19bYgnoj1lA+g/uhIKLe3gL5QANj0+49xwFoFEY5NMXtIEULfjmCb3qp
         4KwNMNKO16hwfeKAudP9+2xwdr+1LrONSrFV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706572903; x=1707177703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnCN62biQQqn1jm8DGkvLeUSFirrT4FwO2mAzGrxaTQ=;
        b=o0RhL4eDdLTuVJYMF3OFBpFr1nX6UGATLXlr5h/R5X7H9pUUeUrY5RNV7lwti0g9Qr
         dzdKnVsXGwRiNUy8EKyWayqXEm0+cSGfJrRG6hI6lttUEqPp0Kp/R/wvWaj/8cvL20NL
         ICNjraeHci4HeSI9D1tfmpuhqGh4goSGKE11ERWCGS8jsCu6yJAAktNfFfn51ymwKmLY
         AifhVqvjDGoh0bItDuGZoY+o5irAiT7t3OvcMABaOdJK889qfyEU6NsCE02tYZVkLjmm
         c3mXcAmY0g10XKYB5jf9UiNzUMbRdyoEYLzsL+tH8xqckJPkO4UwpxVRy1uDAoewuV3d
         BvRg==
X-Gm-Message-State: AOJu0YyVUHRTbDGpMfRUXTRan7aJm+QyHI5enfMEIBlMlTtNcyzwxAaa
	gE6VMGLEKLQPgCqgfVQDVlnnu+iBptkbRz2hkPX7l/JwNe4piS4bMkRNEQQF4I+6WEXgKuLkYvp
	vWB0=
X-Google-Smtp-Source: AGHT+IEfu0v/5rai+eycjNIlcLRQQOndmbsydG64+8uhhfB/qbdWfbo9ZFkr7zi57YNJ5955vrBGow==
X-Received: by 2002:a05:6512:1308:b0:511:f2d:f0f5 with SMTP id x8-20020a056512130800b005110f2df0f5mr3435258lfu.32.1706572903641;
        Mon, 29 Jan 2024 16:01:43 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id g3-20020ac24d83000000b0051022b3e6absm1252665lfe.39.2024.01.29.16.01.42
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 16:01:42 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cf2adac1ccso37810811fa.3
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 16:01:42 -0800 (PST)
X-Received: by 2002:a2e:80c2:0:b0:2d0:4c65:f09f with SMTP id
 r2-20020a2e80c2000000b002d04c65f09fmr2384103ljg.7.1706572901982; Mon, 29 Jan
 2024 16:01:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com> <CAHk-=wh0M=e8R=ZXxa4vesLTtvGmYWJ-w1VmXxW5Mva=Nimk4Q@mail.gmail.com>
 <20240129120125.605e97af@gandalf.local.home> <CAHk-=wghx8Abyx_jcSrCDuNj96SuWS0NvNMhfU8VjFGg9bgm_g@mail.gmail.com>
 <CAHk-=whb91PWEaEJpRGsuWaQpYZGj98ji8HC2vvHD4xb_TqhJw@mail.gmail.com>
 <CAHk-=wgp7UkG31=cCcbSdhMv6-vBJ=orktUOUdiLzw4tQ4gDLg@mail.gmail.com>
 <20240129152600.7587d1aa@gandalf.local.home> <CAHk-=wghobf5qCqNUsafkQzNAZBJiS0=7CRjNXNChpoAvTbvUw@mail.gmail.com>
 <20240129172200.1725f01b@gandalf.local.home> <CAHk-=wjV6+U1FQ8wzQ5ASmqGgby+GZ6wpdh0NrJgA43mc+TEwA@mail.gmail.com>
 <CAHk-=wgOxTeTi02C=kOXsHzuD6XCrV0L1zk1XP9t+a4Wx--xvA@mail.gmail.com> <20240129174950.5a17a86c@gandalf.local.home>
In-Reply-To: <20240129174950.5a17a86c@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jan 2024 16:01:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjbzw3=nwR5zGH9jqXgB8jj03wxWfdFDn=oAVCoymQQJg@mail.gmail.com>
Message-ID: <CAHk-=wjbzw3=nwR5zGH9jqXgB8jj03wxWfdFDn=oAVCoymQQJg@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 14:49, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Now I didn't change this last d_instantiate, because this is not called
> through the lookup code. This is the root events directory and acts more
> like debugfs. It's not "dynamically" added.

Ahh, yes, I see, the dentry was created (as a negative one) with
tracefs_start_creating() -> lookup_one_len().

So  yes, there d_instantiate() is correct, as it's exactly that "turn
negative dentry into a positive one" case.

I'll go see what's up with the "create it again" case - I don't
immediately see what's wrong.

              Linus
