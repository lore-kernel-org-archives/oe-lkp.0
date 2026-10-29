Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306103;
	b=RexfhlQhA+ygRkN81qxuae3mRIA2drGuJP+wj2ylqqWmJLuqMSa49PMdP6/MSDnN53aU
	 KcfQb2S1GAShqK6SXnOcyrOIl/YgztXGavRGvEZC8dFC+lAMkPhEYD6CuSx/xD2P1DvAt
	 CABTRRF4HJTDAvolQB5TMpckCS74VG6LTYj7uQj4dsRix45QXMp9bwixU8DAwdhqnE99F
	 cZwfkQ3tdr58Rty/tQ5J4PUnsKDfksg6/8/GWtrJqYx5mWQRm/t61vns0qTk8UtIKuqpG
	 9iji2aLoieZWkwVJS3L2AePF/3onUk7PL0yJ/AGc60nsqWB4Pu7pvu18Ls1Ld01eXDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306103;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=TwBRg8WB+rHpCwRS7eEIPMYRBlJYkgQhXZO2K1xgu0k=;
	b=zyTQwGJwFkWUkEPxRORrvFZc+H/oNHBAjvTzdHsmYTh0oJqQaAZKt+BZuafUTQDY7E78
	 5tzu2CT0LbLH6I2flrAd2xD+h8EAvVp1k0ubGNIF0Xt0DuD7lCPPDHL/nIXA8jALXoBEt
	 lF+ahI+WiLCWoPPVzUzPsxNbiH98V/qlmDDYyjc523e6bEIalHyx5pt4poIhOWN32IW4R
	 EpO5+732nue9QpuvgJik260eIQmX2e3oKg8Z1QPWQiLerHkKIhTp5u0Hs8de0fYpQEpaR
	 Q6vETM7g3afp2QNa2Eqvclqf6znoJnYgLXMeWqCw/w4T3ggweFfqFbrOGHeJ56M9G7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=CmF6bj5S;
	arc=none smtp.remote-ip=216.40.44.14
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DF5606A323
	for <oe-lkp@lists.linux.dev>; Thu, 29 Oct 2026 20:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04DF5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=CmF6bj5S
Received: from omf16.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 69D251C3D4B;
	Thu, 29 Oct 2026 20:34:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 885BA20016;
	Thu, 29 Oct 2026 20:34:53 +0000 (UTC)
Date: Thu, 29 Oct 2026 16:34:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-trace-kernel@vger.kernel.org,
 oliver.sang@intel.com
Subject: Re: [PATCH] selftests/tracing: Fix flakiness in
 trigger-hist-poll.tc by waiting for task exit
Message-ID: <20261029163452.00d0980c@gandalf.local.home>
In-Reply-To: <178459323652.354837.10711230683477156733.stgit@devnote2>
References: <178459323652.354837.10711230683477156733.stgit@devnote2>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 885BA20016
X-Stat-Signature: ggyzxruufnxauyb3j3aq3mzxgwwgmw5s
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18ueHDgSqMIuIlO/7HrgnvuwcrMJfSEhZw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=TwBRg8WB+rHpCwRS7eEIPMYRBlJYkgQhXZO2K1xgu0k=; b=CmF6bj5SLTT7k3ntF8zoC3ZZD9mMb3EefQXf1TVw1ShSb+HPS5CyjYw7bppuD1QaIc9cu+Pfq2P7NASwyIid8Xlr86Du/bWMFiQu4ZGcNxbN7KNZdVUtpuRMacD81qI9LCsLsJBWxnKSaWL2DIn1+0LlboI4lbDSd9sF80z9IGg=
X-HE-Tag: 1793306093-155062
X-HE-Meta: U2FsdGVkX1/z9pktxOiQ1oTJpVo7xAQ9w9fkgWLW8Ny5EyXe9jLs9KM6WIw+eTx72nRd3WtIBp2UKtMRX88minUcBdDgxbh4725G4K1zPUmvyoaLmzJa0YTpY1lCMyPcBpfFkcv63O7IiIUbVH+ZzoPiZM7Xo0kSYp4f3kk193l3ehbLVoIxvLOAXQ9pjM3lQiQs/u4Vo6NcWbS2eIyw7oAG/LrEGqWp7KVzRd6oszfG5FA8Ss+Vn2S+HyyCssg9ghBx7nLjdAs/7iwN17QXTbT1184k8CYiNiakDKqwx5BYuaiTDLcwN5FvabB0Ww83h5uuQhbpOBfi3jLXGDA6dWb+Ac9b2tzH

On Tue, 21 Jul 2026 09:20:36 +0900

I'm finally getting around to looking at this!

"Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:

> diff --git a/tools/testing/selftests/ftrace/test.d/trigger/trigger-hist-poll.tc b/tools/testing/selftests/ftrace/test.d/trigger/trigger-hist-poll.tc
> index 04eb8546fc07..d54d54f9ec77 100644
> --- a/tools/testing/selftests/ftrace/test.d/trigger/trigger-hist-poll.tc
> +++ b/tools/testing/selftests/ftrace/test.d/trigger/trigger-hist-poll.tc
> @@ -38,11 +38,7 @@ BGPID=$!
>  ${POLL} -I -t 4000 ${EVENT}/hist
>  echo 0 > tracing_on
>  
> -if [ -d /proc/${BGPID} ]; then
> -  echo "poll exits too soon"
> -  kill -KILL ${BGPID} ||:
> -  exit_fail
> -fi
> +wait ${BGPID} 2>/dev/null ||:
>  
>  if ! grep -qw "sleep" trace; then
>    echo "poll exits before event happens"
> @@ -60,11 +56,7 @@ BGPID=$!
>  ${POLL} -P -t 4000 ${EVENT}/hist
>  echo 0 > tracing_on
>  
> -if [ -d /proc/${BGPID} ]; then
> -  echo "poll exits too soon"
> -  kill -KILL ${BGPID} ||:
> -  exit_fail
> -fi
> +wait ${BGPID} 2>/dev/null ||:
>  
>  if ! grep -qw "sleep" trace; then
>    echo "poll exits before event happens"
> @@ -72,3 +64,5 @@ if ! grep -qw "sleep" trace; then
>  fi
>  
>  exit_pass
> +
> +

Hmm, any reason for the two added newlines here?

-- Steve
