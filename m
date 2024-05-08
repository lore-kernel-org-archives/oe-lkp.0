Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C01A2C05
	for <oe-lkp@lists.linux.dev>; Wed,  8 May 2024 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715182904; cv=none; b=N7x7Ct84pD9PXSklsU7SWLwmYVs14lTBkF815kYt57no/Biia7wotW9TkWio2CYrEeNV1nTCgqIh/sc3vpLhPgRgpv5FWnpUDotLjTZIxdF30jq6v3jnJeO0lIB2R22cwr/4A5esomPta+BRc81vdb362tk7DcbgtoEL1KeYWdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715182904; c=relaxed/simple;
	bh=0QX+wUqTX8uTvqVFrPe1wc96NP+540B/w2Zy4R0cLN0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WCEjZx7I+4YIgRh7jlpUrcJyyzBAIsDGTTp/4yqryZNnK0gDUYwpYUP2e4bvXfUqZIso/Y4L9nXlN2rh+ZmJBgX5DSZZPBAyb4Vnr05sqbfkbaOUDZcaP1Pq5RtBwIhRqVLoi1KubMPN5TjYGJKbbKo6fLtMoCqz1iqccrS4CGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HMDTXdtZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HMDTXdtZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47B2C113CC;
	Wed,  8 May 2024 15:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1715182904;
	bh=0QX+wUqTX8uTvqVFrPe1wc96NP+540B/w2Zy4R0cLN0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HMDTXdtZKEJnfRho4IQjxZbFoqp9iDVbVEnuwWFFXauFINufKLCdXQv4RWqEqY6up
	 6tr944UxFGdg00sbecBnM3X9oBtJPXIETrrMBghSdL5tgthlMGyQoAV8/ufAS2M5yl
	 eYp66GQsoq+v04SOMnmexjmgFe3RBtrWyV4MIW0c=
Date: Wed, 8 May 2024 08:41:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel test robot
 <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, Linux
 Memory Management List <linux-mm@kvack.org>, Bill Wendling
 <morbo@google.com>, Eric Biederman <ebiederm@xmission.com>, Justin Stitt
 <justinstitt@google.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Shuah Khan <shuah@kernel.org>, Yang
 Yingliang <yangyingliang@huawei.com>
Subject: Re: [linux-next:master] [selftests]  35c9dcde4e:
 kernel-selftests.exec.load_address_16777216.fail
Message-Id: <20240508084143.fb187694428c4270dfe4d8b0@linux-foundation.org>
In-Reply-To: <202405072057.1DD78A3EBB@keescook>
References: <202405081002.fc4eafcb-oliver.sang@intel.com>
	<202405072057.1DD78A3EBB@keescook>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 May 2024 21:01:52 -0700 Kees Cook <keescook@chromium.org> wrote:

> Can you please drop commit 35c9dcde4ecb ("selftests: exec: make
> binaries position independent")?

Done.
