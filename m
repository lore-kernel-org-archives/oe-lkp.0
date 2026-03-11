Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950F913DDAE
	for <oe-lkp@lists.linux.dev>; Wed, 11 Mar 2026 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225934; cv=pass; b=uRhT/TR+8nGTFPVQl3ueW53cw89CY3/W5GWIQjcx1EueBT+AzE4J9AXqdbbKnqK+7Jkb7UYmuHxWA6ErvavDP7s+7oFIJfXnUQOl42KrVsqnwAwQff+CdmBGLeGvnoz0q7PYY9iBS/xSmAqwhkW6TW6yHuaUErCNik8DIn0HDEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225934; c=relaxed/simple;
	bh=7vsDk25zVBTfwb1axdr1KCfVVl/kd3eHhZd/r75+KnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhB0Si3fEPcB/2BaUMz1xfqoh3mK+ocvBbyqaGwMEr/MGnuyzvTcsjh8Z/6UEsj/r1W9QQGzl44+4ZyXZFYjaycUr15qcvMpbVfjMdUYDw1+2GZbqmeUa0P0/SbVlSjxGlMdPNfdFrCkqTbJiKBE2WBLOUpyP26i/vAe8jkOk3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nHaYHtID; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nHaYHtID"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cd73c4a827so477715085a.3
        for <oe-lkp@lists.linux.dev>; Wed, 11 Mar 2026 03:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773225932; cv=none;
        d=google.com; s=arc-20240605;
        b=lXbMzAhWBi+nffDX2gp/W+Fg7I5QC82VXwGMQsWhNIOnkC16QtbW3mnjG0vSru8zKs
         QNgV5AoNqnKmZnB1fWRanT+9wJxvO3nBfm0TTQZXpYbQ+DNXs3pFTTIB16tNwJuKtRqi
         2JtKHsWUnT0YEMdbKTyvOI1nPXX1igJyVjrjrRJGvMhSueRfreGF2KbR4iEakQxcj1As
         4jVIXF0ud/BAD+y3NIP8BdeGW1n+XveKu6UtJqNUse2KDJYui/xnP5JOQBkALaW4gnv4
         E4mhn6TBVWvK1VOIMOCRH1GiWmbKZ0HeZqwBgjZjpSGPbzkaiEW1Fs03rYNeqLsjaEs2
         r2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7vsDk25zVBTfwb1axdr1KCfVVl/kd3eHhZd/r75+KnU=;
        fh=mqV5FbzvdmVPfhk/3Y0nA0W8rbfv5MwFuX4BJX9vJbI=;
        b=UtUGNHWx6j/deMu1XuGmjpByHPleMETcLcv1B7oOuRvDS5VhSkIeU8vcSI55Vr9l6x
         eCLwY2VzXbS4JS+KaGZxQKg78uAA5N4I8twDNe8xE9GtvcnMrliTb8CudTACOKYy3LbF
         vfvn2iH4B7DiXh5BbK3tlWy9v5uXsdyA4NbHjpBkRQJfkFQVzkKYtTGOIFkh0LbkkGvr
         AIWnrhGhofUhdKzCUfO5hcHs6h4CWqllTsyrr//srUOZbMKmLE/Mr9gcMIF4sMQ2TpNa
         HwNcHIpPxMYVt3Iq0YfLxHQnWYWcxlfLhZs3i20mqaaNQcjnw4FKhSBUxelRktoSrUIC
         qudQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773225932; x=1773830732; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vsDk25zVBTfwb1axdr1KCfVVl/kd3eHhZd/r75+KnU=;
        b=nHaYHtID81yj5bdKU8BwFMrxw1Ok6RxyzUx9qbTA1LxprjTz4QOnj8Lyqhroq0Lvn2
         yMVy7a6OHvzIoXo9y+b8GS1TTZEYyLZEWYnNfIeuzxHo5jiFE68acvrL3pMSfRps/pcQ
         yNXkRRuha1fuFV4lpLOeFmHdJFSBPuwb/iDaIT5DCQlR9jvZRKaOpQVjr8EBzQLfcmLn
         ZkUBo7sO3v3xD5p5hWk6WU+nBLzjeztCGoXAJ2rWPj27wrZlA21tku0JFKX1hZd82be5
         tPz6Ilq2LdMqtO3ZLLkn0B9kPmpQFOXw8fo1Pm1EIXjNy+P2DzVzd5cZZ4QV0hGF+Y4a
         B09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773225932; x=1773830732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7vsDk25zVBTfwb1axdr1KCfVVl/kd3eHhZd/r75+KnU=;
        b=gMwjfmuR8ZFS6YDa7o0Q14hThh3ytCiS5OJMpJiakKD+lcV0Yr6DG+bz+I2ibltJ5L
         /xEYCXnXZb8uKiTpOIPTLbNz3Iui7OtKWiHRK+i8l7ABj51mBfvHokhHIfYoxqcxiDD1
         3QzdRsC2Ozu600Em2ifW+44D101hirQ2LG+iDkLhL+i69ciebYFr7FayrONHrwbLI/nS
         DTETGf8reDIo5aODvXdjCJQG+MN6zY5HvgHt/0CerIMSm0WZp2FoUcnJlkivA31w7njI
         U/B8nhoy1N/3fFSDnnFtkFe+BCwwTBFPwh7PPlUKPilh7We/9EdISbV626kF4RtZ3gcF
         SpiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPLxIOzdI/1mKNalkzDRp3ZbDdseFq8n2nBqKkOwoplM0JIA5loLzjzQjG0TZddjHIKl7Sg+c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9HcTAGO1z90WRSLUpK34/Rwz15hiqRfnss5F1FxiBFPGFbgaJ
	TkGZOWKl7ciyFRjDjQpkeJ5cOgrvVZmZb8vHuWz8Kje2rXczyRMdKHbNuNYsN7zd4FA1HY9mq9F
	+SdF1gluqr3nmC7Owd2PcJrsCy032ZzPNzLCk6BP3
X-Gm-Gg: ATEYQzyKyuH1cy1jObp8oq8r3bRR/B7UV4AN8tP5Fl9VefrN7/aHhMMdtU9dyHxD3lJ
	lV3ApQudZvsjoewYPnnI5nyREwb0rsaffUPiP8nBI390SJW6KgY/HWap7nMOLnKFhkvfRa95Tnr
	WfQfEujkdsBPtNjjskWee7qK6XFanTgjCJTBBOJEOyYlyaWWX7JMPHjGO2Uvk1bFRro5QGC9T9u
	l2EJxXLUTesFBqZx4pNWaF/rqQ7ICWyQi5vCTnfx0C7H81qFM1vz69xWu+vrvK6QUf5AKn/U8jl
	iK1wgpst
X-Received: by 2002:a05:620a:19a3:b0:8cd:8f18:d1d3 with SMTP id
 af79cd13be357-8cda1aa96fcmr238042885a.58.1773225932110; Wed, 11 Mar 2026
 03:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603091409.866c520c-lkp@intel.com> <CANn89iKUdtWw4ptM8ZreRP0a2FuvQOJ5FgE3o4q-zTRTmt1Umg@mail.gmail.com>
 <abFE5PEtrkT5paKB@yuki.lan>
In-Reply-To: <abFE5PEtrkT5paKB@yuki.lan>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 11 Mar 2026 11:45:21 +0100
X-Gm-Features: AaiRm53pzyyhStKrLmQaAlgunggh_gChR9xqV-J3aHPcZ3AKfR6HTggnSd94pyY
Message-ID: <CANn89iL8xwJxLMm+a-QqDUq_NeYSZBAMxvAAJ2_2X0tCd+J7kQ@mail.gmail.com>
Subject: Re: [LTP] [linux-next:master] [icmp] 64db5933c7: ltp.cve-2020-25705.fail
To: Cyril Hrubis <chrubis@suse.cz>
Cc: kernel test robot <oliver.sang@intel.com>, Kuniyuki Iwashima <kuniyu@google.com>, lkp@intel.com, 
	netdev@vger.kernel.org, oe-lkp@lists.linux.dev, 
	Jakub Kicinski <kuba@kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 11:33=E2=80=AFAM Cyril Hrubis <chrubis@suse.cz> wro=
te:
>
> Hi!
> > I do not want to know what this test is doing or expecting.
> >
> > If it expects sysctls to have a precise value, it should set them ?
>
> The test is a CVE reproducer that checks if ICMP message ratelimiting is
> sufficiently randomized so that we do not leak information about the
> system.
>
> See the test source code:
>
> https://github.com/linux-test-project/ltp/blob/master/testcases/cve/icmp_=
rate_limit01.c
>

This test needs to be tweaked/changed.

It has been written with wrong assumption.

(icmp_msgs_burst =3D=3D 50)

Thanks.
