Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C66EB67F
	for <oe-lkp@lists.linux.dev>; Mon,  1 Sep 2025 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756762144; cv=none; b=PC95U7dmbtYevbmYlrbuhlQ+fUxH9Pja3YXaX4x0mQxckv4D4C2o+3vJI5xHfsfuQ+pUIqLu2XzooPIGjwk5eeQXF+7deo4wdZrEzK8N7mk+QWDDGPH+FAg79hiBuFM9IzxQ9XayQN/bRG/jLASqeS3Q1AAShE2Ysc3Me3exbrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756762144; c=relaxed/simple;
	bh=552/6JCfc+JUxNZzimncP4Fs+dFS0i0A1bp0y7OqPfY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=a3RBMTAxL5VqBK3XJO1U+0TkE8YnPvlCb804mGjttM4JB+Ilgey+294xbuZG8KFxcJcEGJ6LmLrHWbeHHoWhrtO9u0kpVlrjEVbKvkCET+Xv/BTmoiqN1mYwfSPWret1uTiutxbEFvxT0Y6YmOOH5rukTrGMUPG1NgtmZxils5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=WjM+pQrx; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="WjM+pQrx"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 581LS5Fb223203
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 1 Sep 2025 14:28:06 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 581LS5Fb223203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025082201; t=1756762087;
	bh=552/6JCfc+JUxNZzimncP4Fs+dFS0i0A1bp0y7OqPfY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=WjM+pQrxsjaHwPfu5TD4QjlSXAysuaTOWlWdBItkXSo83VaSviwaitzlJnp43OlSH
	 IbSQ+zJTXkWoYyirIOanfielbrHFkyCx4pxC5LNqdmBUP+vSyv996TvuS9gw2IPcIN
	 i+SbRviyHAtUh5GUjAOzjIGyKZUuzJuCC5cTMaoup38Cl6XwvceB56NML0McIubCFb
	 I4pXhMPZ4/Qm1bZ4vIS2fiCZlutFM3d6tqrFozyze1gLQA85oDcFL/I4RsHR86iM1A
	 M1odYRxp2gRjMObLBO2IDdFZ1ZpWWAc7cGcc1YrYxdQuNI8kpQ1bNof2+mB3n6bm+2
	 X1AV7tRuDlTYg==
Date: Mon, 01 Sep 2025 14:28:04 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Marcos Del Sol Vives <marcos@orca.pet>,
        kernel test robot <oliver.sang@intel.com>
CC: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
        "Xin Li (Intel)" <xin@zytor.com>,
        Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Subject: Re: [PATCH v2] x86: add hintable NOPs emulation
User-Agent: K-9 Mail for Android
In-Reply-To: <51c25fb7-46be-4364-9371-6a7cb6b07625@orca.pet>
References: <202508291620.bcfb3924-lkp@intel.com> <0ffa7c6e-f32f-4966-85df-3ee5f2426e9e@orca.pet> <33A549B7-B442-402C-A82C-862C0F509274@zytor.com> <51c25fb7-46be-4364-9371-6a7cb6b07625@orca.pet>
Message-ID: <772C4DE8-8564-430D-9304-A39F88E07EBF@zytor.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 1, 2025 4:43:15 AM PDT, Marcos Del Sol Vives <marcos@orca=2Epe=
t> wrote:
>El 31/08/2025 a las 21:32, H=2E Peter Anvin escribi=C3=B3:
>> I'm really, *really* starting to question this approach=2E=20
>>=20
>> The right thing would be to not compile in endbr instructions on 32 bit=
s,
>> since they aren't supported by the kernel (if you try to enable CET/IBT
>> you will crash instantly, because there is no endbr32 at the vdso syste=
m
>> can entry point right now=2E)
>>=20
>> We are talking about a very small number of CPUs stuck between generati=
on
>> 5 and generation 6=2E Most likely we are talking about a much smaller n=
umber
>> than the i486 support we have been debating lately=2E=2E=2E
>
>I assume the kernel is currently simply ignoring the CET flag on ELF for
>all 32-bit x86 binaries and libraries?
>
>Anyhow, seeing this is indeed becoming more tricky and error-prone, I'm
>contating the sudo developer which is, so far, the only software that
>has this issue=2E

Yep=2E
