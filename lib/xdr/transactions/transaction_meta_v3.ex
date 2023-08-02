defmodule StellarBase.XDR.TransactionMetaV3 do
  @moduledoc """
  Automatically generated by xdrgen
  DO NOT EDIT or your changes may be overwritten

  Target implementation: elixir_xdr at https://hex.pm/packages/elixir_xdr

  Representation of Stellar `TransactionMetaV3` type.
  """

  @behaviour XDR.Declaration

  alias StellarBase.XDR.{
    ExtensionPoint,
    LedgerEntryChanges,
    OperationMetaList,
    OptionalSorobanTransactionMeta
  }

  @struct_spec XDR.Struct.new(
                 ext: ExtensionPoint,
                 tx_changes_before: LedgerEntryChanges,
                 operations: OperationMetaList,
                 tx_changes_after: LedgerEntryChanges,
                 soroban_meta: OptionalSorobanTransactionMeta
               )

  @type ext_type :: ExtensionPoint.t()
  @type tx_changes_before_type :: LedgerEntryChanges.t()
  @type operations_type :: OperationMetaList.t()
  @type tx_changes_after_type :: LedgerEntryChanges.t()
  @type soroban_meta_type :: OptionalSorobanTransactionMeta.t()

  @type t :: %__MODULE__{
          ext: ext_type(),
          tx_changes_before: tx_changes_before_type(),
          operations: operations_type(),
          tx_changes_after: tx_changes_after_type(),
          soroban_meta: soroban_meta_type()
        }

  defstruct [:ext, :tx_changes_before, :operations, :tx_changes_after, :soroban_meta]

  @spec new(
          ext :: ext_type(),
          tx_changes_before :: tx_changes_before_type(),
          operations :: operations_type(),
          tx_changes_after :: tx_changes_after_type(),
          soroban_meta :: soroban_meta_type()
        ) :: t()
  def new(
        %ExtensionPoint{} = ext,
        %LedgerEntryChanges{} = tx_changes_before,
        %OperationMetaList{} = operations,
        %LedgerEntryChanges{} = tx_changes_after,
        %OptionalSorobanTransactionMeta{} = soroban_meta
      ),
      do: %__MODULE__{
        ext: ext,
        tx_changes_before: tx_changes_before,
        operations: operations,
        tx_changes_after: tx_changes_after,
        soroban_meta: soroban_meta
      }

  @impl true
  def encode_xdr(%__MODULE__{
        ext: ext,
        tx_changes_before: tx_changes_before,
        operations: operations,
        tx_changes_after: tx_changes_after,
        soroban_meta: soroban_meta
      }) do
    [
      ext: ext,
      tx_changes_before: tx_changes_before,
      operations: operations,
      tx_changes_after: tx_changes_after,
      soroban_meta: soroban_meta
    ]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr()
  end

  @impl true
  def encode_xdr!(%__MODULE__{
        ext: ext,
        tx_changes_before: tx_changes_before,
        operations: operations,
        tx_changes_after: tx_changes_after,
        soroban_meta: soroban_meta
      }) do
    [
      ext: ext,
      tx_changes_before: tx_changes_before,
      operations: operations,
      tx_changes_after: tx_changes_after,
      soroban_meta: soroban_meta
    ]
    |> XDR.Struct.new()
    |> XDR.Struct.encode_xdr!()
  end

  @impl true
  def decode_xdr(bytes, struct \\ @struct_spec)

  def decode_xdr(bytes, struct) do
    case XDR.Struct.decode_xdr(bytes, struct) do
      {:ok,
       {%XDR.Struct{
          components: [
            ext: ext,
            tx_changes_before: tx_changes_before,
            operations: operations,
            tx_changes_after: tx_changes_after,
            soroban_meta: soroban_meta
          ]
        }, rest}} ->
        {:ok, {new(ext, tx_changes_before, operations, tx_changes_after, soroban_meta), rest}}

      error ->
        error
    end
  end

  @impl true
  def decode_xdr!(bytes, struct \\ @struct_spec)

  def decode_xdr!(bytes, struct) do
    {%XDR.Struct{
       components: [
         ext: ext,
         tx_changes_before: tx_changes_before,
         operations: operations,
         tx_changes_after: tx_changes_after,
         soroban_meta: soroban_meta
       ]
     }, rest} = XDR.Struct.decode_xdr!(bytes, struct)

    {new(ext, tx_changes_before, operations, tx_changes_after, soroban_meta), rest}
  end
end